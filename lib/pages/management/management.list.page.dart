import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/management.list.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'management.add.page.dart';

class ManagementListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ManagementListPageState();
  }
}

class ManagementListPageState extends State<ManagementListPage> {
  ManagementListController _controller = ManagementListController();

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
  Widget build(BuildContext context) =>
      Observer(
        builder: (_) =>
            Scaffold(
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
                        return CenteredMessage(snapshot.error.toString());
                      } else {
                        if (snapshot.data == null)
                          return CenteredMessage(
                            _controller.errorMsg,
                          );
                        if (snapshot.data.length > 0) {
                          _controller.init();
                          _controller.loadAdmins(snapshot.data);
                          _controller.associateds.sort(
                                (a, b) => a.name.compareTo(b.name),
                          );
                          return _widgets();
                        } else
                          return CenteredMessage(
                            'Não existem associados cadastrados. Confira as requisições de acesso.',
                          );
                      }
                  } //switch (snapshot.connectionState)
                  return CenteredMessage(
                    'Houve um erro desconhecido ao executar a transação.',
                  );
                },
              ),
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
              floatingActionButton: _controller.isHidedButton
                  ? null
                  : Button(icon: Icons.add, onClick: () {
                Navigator.push(
                  _,
                  MaterialPageRoute(
                      builder: (_) => ManagementAddPage()),
                );
              }),
            ),
      );

  _widgets() =>
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: [
            TopBar(),
            MyTextFormField(
              textEditingController: _controller.nameCtrl,
              label: labelNamePayment,
              hint: hintNamePayment,
              icon: Icons.search,
              inputType: TextInputType.text,
              onChanged: _controller.setFilter,
            ),
            Expanded(
              child: Observer(
                builder: (_) =>
                    ListView.separated(
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
                              _controller.listFiltered[i].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text('Tel.: ' +
                                (_controller.listFiltered[i].phone != null
                                    ? _controller.listFiltered[i].phone
                                    : 'Não informado') +
                                '\n' +
                                'Status: ' +
                                _controller.listFiltered[i].status),
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
            ),
          ],
        ),
      );

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(
              msg: 'Deseja excluir o registro selecionado?');
        });
    if (response == true) {
/*      _controller.deleteById(_controller.accessRequests[i]).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Requisição de acesso excluída com sucesso.'),
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
      });*/
    }
  }
}
