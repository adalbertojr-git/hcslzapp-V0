import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';
import 'package:hcslzapp/controllers/item.model.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:mobx/mobx.dart';

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
      if (value.isNotEmpty) {
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
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      _controller.loadRequests((snapshot.data)!);
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
              : Button(icon: Icons.save, onClick: () => _check()),
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
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.listItems.length,
                  itemBuilder: (_, int i) {
                    return CheckboxWidget(
                      item: _controller.listItems[i],
                      controller: _controller,
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      );

  _check() {
    print(_controller.accessRequests);
    List<AccessRequest> list =
        List<AccessRequest>.from(_controller.accessRequests);
/*    _controller.check().then(
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
    );*/
  }
}

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({required this.item, required this.controller});

  final ItemModel item;
  final AccessRequestController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
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
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            item.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(item.email!),
          value: item.check,
          onChanged: _onChanged,
          secondary: GestureDetector(
            child: Icon(
              Icons.delete,
            ),
            onTap: () {
              _delete(item, context);
            },
          ),
        ),
      ),
    );
  }

  _onChanged(bool? value) {
    item.check = value;
    if (value!) {
      controller.ids.add(item.id);
      controller.accessRequests?.add(item);
    } else {
      controller.ids.remove(item.id);
    }
  }

  _delete(ItemModel item, BuildContext context) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      controller.deleteById(item.id).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: const Text('Requisição de acesso excluída com sucesso.'),
            ),
          );
          controller.listItems.remove(item);
        } else {
          asuka.showSnackBar(
            SnackBar(
              content: Text(controller.errorMsg),
            ),
          );
        }
      });
    }
  }
}
