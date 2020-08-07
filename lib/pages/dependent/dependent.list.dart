import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.dart';

const _tituloAppBar = 'Lista de Dependentes';

class DependentList extends StatefulWidget {
  List<Dependent> listDependentes;

  DependentList(this.listDependentes);

  @override
  State<StatefulWidget> createState() {
    return DependentListState();
  }
}

class DependentListState extends State<DependentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_tituloAppBar),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.listDependentes.length,
          itemBuilder: (context, indice) {
            final dependente = widget.listDependentes[indice];
            return ItemList(
              dependente,
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DependentAdd(dependente),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Dependent> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DependentAdd(null);
              },
            ),
          );
          future.then(
            (dependenteRecebido) {
              _atualiza(dependenteRecebido);
            },
          );
        },
      ),
    );
  }

  void _atualiza(Dependent dependenteRecebido) {
    if (dependenteRecebido != null) {
      setState(
        () {
          widget.listDependentes.add(dependenteRecebido);
        },
      );
    }
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
            Icons.people,
            color: Colors.deepOrange,
            size: 50,
          ),
          title: Text(
            _dependente.name.toString(),
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
          subtitle: Text(
            _dependente.email.toString(),
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