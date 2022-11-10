import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/head.notification.list.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'head.notification.add.page.dart';

const String _labelNotExists = 'Não existem avisos cadastrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Avisos da Diretoria';

class HeadNotificationListPage extends StatefulWidget {
  final String _selectedProfile;

  HeadNotificationListPage(this._selectedProfile);

  @override
  State<StatefulWidget> createState() {
    return HeadNotificationListPageState();
  }
}

class HeadNotificationListPageState extends State<HeadNotificationListPage> {
  HeadNotificationListController _controller = HeadNotificationListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
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
                      title: _title,
                      message: snapshot.error.toString(),
                    );
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      _controller.headNotifications.addAll((snapshot.data)!);
                      _controller.headNotifications.sort(
                        (a, b) => a.title.compareTo(b.title),
                      );
                      return _widgets();
                    } else
                      return widget._selectedProfile == ADMIN
                          ? _widgets()
                          : CenteredMessage(
                              title: _title,
                              message: _labelNotExists,
                            );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: _title,
                message: _labelUnknown,
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: widget._selectedProfile == ADMIN
              ? Observer(
                  builder: (_) => _controller.isHidedButton
                      ? Container()
                      : Button(
                          icon: Icons.add,
                          onClick: () {
                            _add(context, null);
                          },
                        ),
                )
              : Container(),
        ),
      );

  _widgets() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TopBar(
              title: _title,
            ),
            MyTextFormField(
              textEditingController: _controller.titleCtrl,
              label: labelNotificationTitle,
              hint: hintNotificationTitle,
              icon: Icons.search,
              inputType: TextInputType.text,
              onChanged: _controller.setFilter,
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.listFiltered.length,
                  itemBuilder: (_, int i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 5.0),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          _controller.listFiltered[i].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Data de Publicação: ' +
                            (_controller.listFiltered[i].datePublication)),
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
                                _delete(i);
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_forward,
                              ),
                              onTap: () {
                                _add(context, _controller.listFiltered[i]);
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
        ),
      );

  _add(BuildContext context, HeadNotification? headNotification) {
    final Future future = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HeadNotificationAddPage(headNotification),
      ),
    );
    future.then((value) {
      if (value != null) {
        _controller.headNotifications.add(value);
      }
    });
  }

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      var notification = _controller.selectedNotifications[i] as HeadNotification;
      _controller.deleteById(notification).then(
            (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: const Text('Aviso excluido com sucesso.'),
              ),
            );
            setState(() {
              _controller.removeSelectedNotification(i);
            });
          } else {
            asuka.showSnackBar(
              SnackBar(
                content: Text(_controller.errorMsg),
              ),
            );
          }
        },
      );
    }
  }
}
