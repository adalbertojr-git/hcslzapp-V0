import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/management.list.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../http/http.exception.dart';
import 'management.add.page.dart';

const String _title = 'Administradores';

class ManagementListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ManagementListPageState();
  }
}

class ManagementListPageState extends State<ManagementListPage> {
  final ManagementListController _controller = ManagementListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      if (value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<List<Associated>>(
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
                      _controller.associateds.addAll(snapshot.data!);
                      _controller.associateds.sort(
                        (a, b) => a.name.compareTo(b.name),
                      );
                      return _widgets();
                    } else
                      return CenteredMessage(
                        title: WARNING,
                        message: NOTEXIST,
                      );
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
                    _add(context);
                  }),
        ),
      );

  _add(BuildContext context) {
    final Future future = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManagementAddPage(),
      ),
    );
    future.then(
      (items) {
        if (items != null) {
          items.forEach((element) {
            if (element.check) {
              _controller.associateds.add(Associated(
                id: element.id,
                name: element.name,
                phone: element.phone,
                status: element.status,
                dependents: List<Dependent>.from([]),
                motorcycles: List<Motorcycle>.from([]),
                authenticate: element.authenticate,
                dateShield: '',
                cpf: '',
                associatedType: '',
                sponsor: '',
                cnh: '',
                email: '',
                dateBirth: '',
                photoUrl: '',
                bloodType: '',
              ));
            }
          });
        }
      },
    );
  }

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.associateds.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(
                        _controller.associateds[i].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Tel.: ' +
                          (_controller.associateds[i].phone != null
                              ? _controller.associateds[i].phone
                              : 'Não informado') +
                          '\n' +
                          'Status: ' +
                          _controller.associateds[i].status),
                      leading: CircleAvatar(
                        child: Icon(Icons.admin_panel_settings),
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
                              _delete(_controller.associateds[i]);
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

  _delete(Associated associated) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      if (_controller.associateds.length == 1) {
        AsukaSnackbar.alert(
                'Deve haver pelo menos um Administrador cadastrado.')
            .show();
      } else {
        try {
          await _controller.deleteById(associated);
          AsukaSnackbar.success(SUCCESS).show();
          _controller.associateds.removeWhere(
            (item) => item.id == associated.id,
          );
        } on HttpException catch (e) {
          AsukaSnackbar.alert(e.message.toString()).show();
        } catch (e) {
          AsukaSnackbar.alert(e.toString()).show();
        } finally {}
      }
    }
  }
}
