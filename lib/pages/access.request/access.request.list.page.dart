import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:asuka/asuka.dart' as asuka;

const String _labelNotExists =
    'Não existem requisições de acesso a serem aprovadas.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Requisições de Acesso';

class AccessRequestListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccessRequestListPageState();
  }
}

class AccessRequestListPageState extends State<AccessRequestListPage> {
  AccessRequestController _controller = AccessRequestController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<AccessRequest>>(
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
                    if (snapshot.data.length > 0) {
                      _controller.init();
                      _controller.accessRequests.addAll(snapshot.data);
                      _controller.accessRequests.sort(
                        (a, b) => a.name.compareTo(b.name),
                      );
                      return _widgets();
                    } else
                      return CenteredMessage(
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
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(icon: Icons.check, onClick: () => _check()),
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
            TopBar(),
            Observer(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: _controller.accessRequests.length,
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
                      title: Text(_controller.accessRequests[i].name),
                      subtitle: Text(_controller.accessRequests[i].email),
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
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
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ],
        ),
      );

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma exclusão?');
        });
    if (response == true) {
      _controller.deleteById(_controller.accessRequests[i]).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: const Text('Requisição de acesso excluída com sucesso.'),
            ),
          );
          _controller.accessRequests.removeAt(i);
        } else {
          asuka.showSnackBar(
            SnackBar(
              content: Text(_controller.errorMsg),
            ),
          );
        }
      });
    }
  }

  _check() {
    _controller.check().then(
      (value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Requisições de acesso autorizadas com sucesso.'),
            ),
          );
          Navigator.of(context).pop();
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
