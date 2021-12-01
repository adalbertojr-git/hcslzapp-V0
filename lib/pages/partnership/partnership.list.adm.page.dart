import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/pages/partnership/partnership.add.page.dart';
import 'package:asuka/asuka.dart' as asuka;

const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';

class PartnershipListAdmPage  extends StatelessWidget {
  PartnershipListController _controller = PartnershipListController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Partnership>>(
          future: _controller.getFuture(),
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
                    _controller.partnerships.addAll(snapshot.data);
                    _controller.partnerships.sort(
                      (a, b) => a.partner.compareTo(b.partner),
                    );
                  }
                  return _widgets(context);
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              _labelUnknown,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Button(
          icon: Icons.add,
          onClick: () {
            final Future<Partnership> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PartnershipAddPage(null)),
            );
            future.then(
                  (partnership) {
                if (partnership != null) {
                  _controller.partnerships.add(partnership);
                }
              },
            );
          }
        ),
      );

  _widgets(BuildContext context) => Container(
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
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.partnerships.length,
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
                            _controller.partnerships[i].partner,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              'Status: ' + _controller.partnerships[i].status),
                          leading: CircleAvatar(
                            child: Icon(Icons.emoji_people),
                            backgroundColor: Colors.white,
                          ),
                          trailing: Wrap(
                            spacing: 10,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.delete,
                                ),
                                onTap: () {
                                  _delete(context, i);
                                },
                              ),
                              GestureDetector(
                                  child: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    final Future<Partnership> future =
                                        Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PartnershipAddPage(
                                                  _controller.partnerships[i])),
                                    );
                                    future.then((partnership) {
                                      if (partnership != null) {
                                        _controller.partnerships.removeAt(i);
                                        _controller.partnerships
                                            .insert(i, partnership);
                                      }
                                    });
                                  }),
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      );

  _delete(BuildContext context, int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(
              msg: 'Confirma exclusão?');
        });
    if (response == true) {
      _controller.deleteById(_controller.partnerships[i]).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: const Text('Parceiro excluído com sucesso.'),
            ),
          );
          _controller.partnerships.removeAt(i);
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
