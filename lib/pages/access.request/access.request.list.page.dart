import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';
import 'package:hcslzapp/controllers/item.model.dart';
import 'package:hcslzapp/models/access.request.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

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
  final AccessRequestController _controller = AccessRequestController();

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
          appBar: MyAppBar(_title),
          bottomNavigationBar: MyBottomAppBar(),
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
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _controller.isHidedButton
              ? SizedBox()
              : Button(icon: Icons.save, onClick: () => _allow()),
        ),
      );

  _widgets() => ListView(
        children: [
          SizedBox(height: 10),
          Observer(
            builder: (_) => ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemCount: _controller.listItems.length,
              itemBuilder: (_, int i) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: CheckboxWidget(
                    item: _controller.listItems[i],
                    controller: _controller,
                  ),
                );
              },
              separatorBuilder: (_, int index) => const Divider(),
            ),
          ),
        ],
      );

  _allow() {
    _controller.allow().then(
      (value) {
        if (value != null) {
          AsukaSnackbar.success('Requisições de acesso liberadas com sucesso');
          Navigator.of(context).pop();
        } else {
          AsukaSnackbar.alert(_controller.errorMsg).show();
        }
      },
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    required this.item,
    required this.controller,
  });

  final ItemModel item;
  final AccessRequestController controller;

  @override
  Widget build(BuildContext context) => Observer(
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

  _onChanged(bool? value) {
    item.check = value;
    if (value!) {
      controller.ids.add(item.id);
      controller.accessRequests.addAll(
        [
          AccessRequest(
            id: item.id,
            name: item.name!,
            user: item.user!,
            email: item.email!,
            password: item.password!,
          ),
        ],
      );
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
          AsukaSnackbar.success('Requisição de acesso excluída com sucesso');
          controller.listItems.remove(item);
        } else {
          AsukaSnackbar.alert(_controller.errorMsg).show();
        }
      });
    }
  }
}
