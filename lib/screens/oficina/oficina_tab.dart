import 'package:flutter/material.dart';
import 'package:hcslzapp/screens/oficina/cadastrar_defeitos.dart';
import 'package:hcslzapp/screens/oficina/lista_defeitos.dart';

const _tituloAppBar = 'Oficina';

class OficinaTab extends StatelessWidget {
  const OficinaTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.add_circle), text: 'Cadastrar Defeito'),
      Tab(icon: Icon(Icons.search), text: 'Pesquisar'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            _tituloAppBar,
            style: TextStyle(color: Colors.orange),
          ),
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 25.0),
                insets: EdgeInsets.symmetric(horizontal: 30.0)),
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(children: <Widget>[
          OficinaCadastrarDefeitos(),
          OficinaListaDefeitos(),
        ]),
      ),
    );
  }
}
