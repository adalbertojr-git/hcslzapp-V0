import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/item.model.dart';
import 'package:hcslzapp/controllers/management.add.controller.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../models/associated.dart';

const String _labelAllAdmins =
    'Todos os associados já estão com perfil de Administrador.';
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
                        title: _title, message: snapshot.error.toString());
                  } else {
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
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
              : Button(icon: Icons.save, onClick: () => _save(context)),
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
          ),
        ],
      );

  _save(BuildContext context) async {
    try {
      if (_controller.ids.isEmpty) {
        AsukaSnackbar.alert(SELECT).show();
      } else {
        await _controller.save();
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.pop(context, _controller.listItems);
      }
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
  final ManagementAddController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          item.name!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle:
            Text('Tel.: ' + item.phone! + '\n' + 'Status: ' + item.status!),
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
    );
  }
}
