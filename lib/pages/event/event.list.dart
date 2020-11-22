import 'package:flutter/material.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/pages/motorcycle/motorcycle.add.dart';

class EventList extends StatefulWidget {
  final List<Motorcycle> _listMotocicletas = List();

  @override
  State<StatefulWidget> createState() {
    return EventListState();
  }
}

class EventListState extends State<EventList> {
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
          itemCount: widget._listMotocicletas.length,
          itemBuilder: (context, indice) {
            final motocicleta = widget._listMotocicletas[indice];
            return ItemList(motocicleta);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Motorcycle> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                //return MotorcycleAdd();
              },
            ),
          );
/*          future.then(
            (motocicletaRecebida) {
              _atualiza(motocicletaRecebida);
            },
          );*/
        },
      ),
    );
  }

  void _atualiza(Motorcycle motocicletaRecebida) {
    if (motocicletaRecebida != null) {
      setState(
        () {
          widget._listMotocicletas.add(motocicletaRecebida);
        },
      );
    }
  }
}

class ItemList extends StatelessWidget {
  final Motorcycle _motocicleta;

  ItemList(this._motocicleta);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            listIcon(),
                            listModeloAnoCor(),
                            Spacer(),
                            listPlaca(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listIcon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.motorcycle,
          color: Colors.orange,
          size: 60,
        ),
      ),
    );
  }

  Widget listModeloAnoCor() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: _motocicleta.model.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          children: <TextSpan>[
            TextSpan(
              text: '\n' + _motocicleta.year.toString(),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '\n' + _motocicleta.color.toString(),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget listPlaca() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: _motocicleta.licencePlate.toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
