import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:hcslzapp/models/dependent.dart';

import 'access.request.page.dart';

class AccessRequestList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccessRequestListState();
  }
}

class AccessRequestListState extends State<AccessRequestList> {
  AccessRequestController _controller = AccessRequestController();
  List<AccessRequest> _accessRequestList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<AccessRequest>>(
          future: _controller.findAll(),
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
                  return CenteredMessage(snapshot.error);
                } else {
                  if (snapshot.data == null)
                    return CenteredMessage(
                      _controller.errorMsg,
                    );
                  if (snapshot.data.length > 0) {
                    _accessRequestList = snapshot.data;
                    //_controller.associated = snapshot.data.first;
                    //_controller.init;
                    return buildListView();
                  } else
                    return CenteredMessage(
                      'Dados do associado especificado não foram encontrados.',
                    );
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              'Houve um erro desconhecido ao executar a transação.',
            );
          },
        ),
      );

  @override
  Widget buildxxx(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        child: buildListView(),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: this._accessRequestList.length,
      itemBuilder: (context, indice) {
        final accessRequest = this._accessRequestList[indice];
        return ItemList(
          accessRequest,
          onClick: null,
        );
      },
    );
  }

  void _atualiza(Dependent dependenteRecebido) {
    if (dependenteRecebido != null) {
      setState(
        () {
          //widget.listDependentes.add(dependenteRecebido);
        },
      );
    }
  }
}

class ItemList extends StatelessWidget {
  final AccessRequest _accessRequest;
  final Function onClick;

  ItemList(
    this._accessRequest, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.black,
        child: ListTile(
          onTap: () => onClick(),
          leading: Icon(
            Icons.insert_drive_file,
            color: Colors.deepOrange,
            size: 50,
          ),
          title: Text(
            _accessRequest.name.toString(),
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
          subtitle: Text(
            'Teste', //_dependente.email.toString(),
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
