import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/associated.list.controller.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/pages/associated/associated.update.page.dart';

class AssociatedList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AssociatedListState();
  }
}

class AssociatedListState extends State<AssociatedList> {
  AssociatedListController _controller = AssociatedListController();

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
                      _controller.init;
                      _controller.associateds.addAll(snapshot.data);
                      return _widgets();
                    } else
                      return CenteredMessage(
                        'Não existem requisições de acesso a serem aprovadas.',
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
              : Button(icon: Icons.save, onClick: () {}),
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
                      'Email: ' +
                      (_controller.associateds[i].email != null
                          ? _controller.associateds[i].email
                          : 'Não informado')),
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
                          size: 30.0,
                        ),
                        onTap: () {
                          _controller.associateds.removeAt(i);
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 30.0,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssociatedUpdate(
                                    _controller.associateds[i].id)),
                          );
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
      );
/*
  get _check {
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
  }*/
}
