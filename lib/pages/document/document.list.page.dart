import 'package:flutter/material.dart';
import 'package:hcslzapp/models/dependent.dart';

class DocumentListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DocumentListPageState();
  }
}

class DocumentListPageState extends State<DocumentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: null,//widget.listDependentes.length,
          itemBuilder: (context, indice) {
            //final dependente = widget.listDependentes[indice];
            return ItemList(
              null, onClick: null, //dependente,
            );
          },
        ),
      ),
    );
  }

}

class ItemList extends StatelessWidget {
  final Dependent _dependente;
  final Function onClick;

  ItemList(
    this._dependente, {
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
            'Teste',//_dependente.nome.toString(),
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
          subtitle: Text(
            'Teste',//_dependente.email.toString(),
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