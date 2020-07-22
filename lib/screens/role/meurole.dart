import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hcslzapp/components/appBar.dart';
import 'package:hcslzapp/components/text_field.dart';

class MeuRole extends StatefulWidget {
  const MeuRole({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MeuRoleState createState() => _MeuRoleState();
}

class _MeuRoleState extends State<MeuRole> {
  GoogleMapController mapController;
  double lat = -2.5152639;
  double long = -44.2329928;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Meu Role"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _buildMap(),
            _buildTextsAndButtons(),
          ],
        ),
      ),
    );
  }

  Expanded _buildMap() {
    return Expanded(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        onCameraMove: (data) {
          print(data);
        },
        onTap: (LatLng position) {
          print(position);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 14.0,
        ),
      ),
    );
  }

  Container _buildTextsAndButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Distancia Percorrida: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                ),
              ),
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Velocidade Max: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  heroTag: "btnStart",
                  backgroundColor: Colors.black,
                  child: Icon(Icons.play_circle_outline),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Tempo gasto: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                ),
              ),
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Angulo de Inclinaçao: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  heroTag: "btnStop",
                  backgroundColor: Colors.black,
                  child: Icon(Icons.stop),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
