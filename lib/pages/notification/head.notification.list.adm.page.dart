import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/head.notification.list.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import 'head.notification.add.page.dart';

const String _title = 'Avisos da Diretoria';

class HeadNotificationListAdmPage extends StatefulWidget {
  @override
  State<HeadNotificationListAdmPage> createState() =>
      _HeadNotificationListAdmPageState();
}

class _HeadNotificationListAdmPageState
    extends State<HeadNotificationListAdmPage> {
  final HeadNotificationListController _controller =
      HeadNotificationListController();

  @override
  void initState() {
    _controller.init();
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
          body: FutureBuilder<List<HeadNotification>>(
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
                      _controller.headNotifications.addAll(snapshot.data!);
                      _controller.headNotifications.sort(
                        (a, b) =>
                            b.datePublication.compareTo(a.datePublication),
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
                    _add(context, -1);
                  }),
        ),
      );

  _widgets(BuildContext context) => Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.headNotifications.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(
                        _controller.headNotifications[i].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Publicação: ' +
                          (_controller.headNotifications[i].datePublication)),
                      leading: CircleAvatar(
                        child: Icon(Icons.message),
                        backgroundColor: Colors.white,
                      ),
                      trailing: Wrap(
                        spacing: 10, // space between two icons
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.delete,
                            ),
                            onTap: () {
                              _delete(context, i);
                            },
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward,
                            ),
                            onTap: () {
                              _add(context, i);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ),
        ],
      );

  _add(BuildContext context, int i) {
    HeadNotification? headNotification =
        i.isNegative ? null : _controller.headNotifications[i];
    final Future future = Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HeadNotificationAddPage(headNotification)),
    );
    future.then((value) {
      if (value != null) {
        if (!i.isNegative) {
          _controller.headNotifications.removeAt(i);
          _controller.headNotifications.insert(i, value);
        } else
          _controller.headNotifications.add(value);
      }
    });
  }

  _delete(BuildContext context, int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      try {
        await _controller.deleteById(_controller.headNotifications[i]);
        AsukaSnackbar.success(SUCCESS).show();
        _controller.headNotifications.removeAt(i);
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
