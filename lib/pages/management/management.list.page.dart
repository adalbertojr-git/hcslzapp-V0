import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/management.list.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../models/associated.dto.dart';
import 'management.add.page.dart';

const String _labelNotExists =
    'Não existem associados cadastrados. Confira as requisições de acesso.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar: MyBottomAppBar(),
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
                      _controller.loadAdmins(snapshot.data!);
                      _controller.associateds.sort(
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

  _widgets() => Center(
    child: ListView(
      children: [
        Expanded(
          child: Observer(
            builder: (_) => ListView.separated(
              shrinkWrap: true,
              itemCount: _controller.associateds.length,
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
    ),
  );

  _delete(Associated associated) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      if (_controller.associateds.length == 1) {
        asuka.showSnackBar(
          SnackBar(
            content: const Text(
                'Deve haver pelo menos um Administrador cadastrado.'),
          ),
        );
      } else {
        _controller.deleteById(associated).then((value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: const Text('Administrador excluído com sucesso.'),
              ),
            );
            _controller.associateds.removeWhere(
              (item) => item.id == associated.id,
            );
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
  }
}
