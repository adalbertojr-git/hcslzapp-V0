import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/item.model.dart';
import 'package:hcslzapp/controllers/management.add.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:asuka/asuka.dart' as asuka;

import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../models/associated.dto.dart';

const String _labelNotExists =
    'Não existem associados cadastrados. Confira as requisições de acesso.';
const String _labelAllAdmins =
    'Todos os associados já estão com perfil de Administrador.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Adicionar Administrador';

class ManagementAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ManagementAddPageState();
  }
}

class ManagementAddPageState extends State<ManagementAddPage> {
  final ManagementAddController _controller = ManagementAddController();

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
          body: FutureBuilder<List<AssociatedDTO>>(
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
                        title: _title, message: snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      //_controller.loadNotAdmins(snapshot.data!);
                      _controller.loadListItems(snapshot.data!);
                      if (_controller.listItems.length > 0) {
                        _controller.listItems.sort(
                          (a, b) => a.name!.compareTo(b.name!),
                        );
                        return _widgets();
                      } else
                        return CenteredMessage(
                          title: _title,
                          message: _labelAllAdmins,
                        );
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
          bottomNavigationBar: _controller.isHidedButton
              ? null
              : MyBottomAppBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(icon: Icons.save, onClick: () => _save(context)),
        ),
      );

  _widgets() => Center(
    child: ListView(
      children: [
        SizedBox(height: 10),
        Observer(
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
      ],
    ),
  );

  _save(BuildContext context) {
    _controller.save().then(
      (value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: const Text('Admininstradore(s) salvo(s) com sucesso.'),
            ),
          );
          Navigator.pop(context, _controller.listItems);
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

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    required this.item,
    required this.controller,
  });

  final ItemModel item;
  final ManagementAddController controller;

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
          subtitle: Text('Tel.: ' +
              (item.phone ?? 'Não informado') +
              '\n' +
              'Status: ' +
              item.status!),
          value: item.check,
          onChanged: (bool? value) {
            item.check = value;
            if (value != null && value) {
              controller.ids.add(item.id);
              controller.associateds.add(item);
            } else {
              controller.ids.remove(item.id);
            }
          },
          secondary: CircleAvatar(
            child: Icon(Icons.person),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
