import 'package:flutter/material.dart';
import 'package:hcslzapp/models/dependent.dart';

const _tituloAppBar = 'Mensalidades';

class ListaMensalidades1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ListaMensalidades1State();
  }
}

class ListaMensalidades1State extends State<ListaMensalidades1> {

  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(12, (i) => "Ano 2020 - Mes $i");
  var items = List<String>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_tituloAppBar),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*void _atualiza(Dependente dependenteRecebido) {
  if (dependenteRecebido != null) {
    setState(
          () {
        //widget.listDependentes.add(dependenteRecebido);
      },
    );
  }*/

//}}


class ItemList extends StatelessWidget {
  final Dependent _dependente;
  final Function onClick;

  ItemList(this._dependente, {
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
            'Teste', //_dependente.nome.toString(),
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