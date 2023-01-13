import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/pages/partnership/partnership.add.page.dart';
import '../../common/messages.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../http/http.exception.dart';

const String _title = 'Parcerias';

class PartnershipListAdmPage extends StatefulWidget {
  @override
  State<PartnershipListAdmPage> createState() => _PartnershipListAdmPageState();
}

class _PartnershipListAdmPageState extends State<PartnershipListAdmPage> {
  final PartnershipListController _controller = PartnershipListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<List<Partnership>>(
            future: _controller.future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                default:
                  if (snapshot.hasError) {
                    return CenteredMessage(
                      title: ERROR,
                      message: snapshot.error.toString(),
                    );
                  } else {
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      _controller.partnerships.addAll(snapshot.data!);
                      _controller.partnerships.sort(
                        (a, b) => a.partner.compareTo(b.partner),
                      );
                    }
                    return _widgets(context);
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: ERROR,
                message: UNKNOWN,
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(
                  icon: Icons.add,
                  onClick: () {
                    final Future future = Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PartnershipAddPage(null)),
                    );
                    future.then(
                      (partnership) {
                        if (partnership != null) {
                          _controller.partnerships.add(partnership);
                        }
                      },
                    );
                  }),
        ),
      );

  _widgets(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.partnerships.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                        title: Text(
                          _controller.partnerships[i].partner,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            'Status: ' + _controller.partnerships[i].status),
                        leading: CircleAvatar(
                          child: Icon(Icons.emoji_people),
                          backgroundColor: Colors.white,
                        ),
                        trailing: Wrap(
                          spacing: 10,
                          children: [
                            GestureDetector(
                              child: Icon(
                                Icons.delete,
                              ),
                              onTap: () {
                                _delete(context, i);
                              },
                            ),
                            GestureDetector(
                                child: Icon(Icons.arrow_forward),
                                onTap: () {
                                  final Future future = Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PartnershipAddPage(
                                                _controller.partnerships[i])),
                                  );
                                  future.then((partnership) {
                                    if (partnership != null) {
                                      _controller.partnerships.removeAt(i);
                                      _controller.partnerships
                                          .insert(i, partnership);
                                    }
                                  });
                                }),
                          ],
                        )),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ),
        ],
      );

  _delete(BuildContext context, int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      try {
        await _controller.deletePhoto(_controller.partnerships[i]);
        await _controller.deleteById(_controller.partnerships[i]);
        AsukaSnackbar.success(SUCCESS).show();
        _controller.partnerships.removeAt(i);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
