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
import '../../http/http.exception.dart';

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
              ? null
              : Button(icon: Icons.save, onClick: () => _allow()),
        ),
      );

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
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
      );

  _allow() {
    try {
      _controller.allow();
      AsukaSnackbar.success('Requisições de acesso liberadas com sucesso')
          .show();
      Navigator.of(context).pop();
    } on HttpException catch (e) {
      AsukaSnackbar.alert(e.message.toString()).show();
    } on Exception catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
    } catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
    } finally {}
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
            color: Colors.deepOrange[300],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
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
          loadAccessRequest(item),
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
      try {
        controller.deleteById(loadAccessRequest(item));
        AsukaSnackbar.success('Requisição de acesso excluída com sucesso')
            .show();
        controller.listItems.remove(item);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } on Exception catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }

  AccessRequest loadAccessRequest(ItemModel item) => AccessRequest(
        id: item.id,
        name: item.name!,
        user: item.user!,
        email: item.email!,
        password: item.password!,
      );
}
