import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Meu Role",
          style: TextStyle(color: Colors.orange),
        ),
        actions: <Widget>[_buildButtons()],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            _buildMap(),
            _buildInfoTexts(),
          ],
        ),
      ),
    );
  }

  Row _buildButtons() {
    return Row(
      children: <Widget>[
        Container(
          child: FloatingActionButton(
            heroTag: "btnStart",
            mini: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange,
            child: Icon(Icons.play_circle_outline),
            onPressed: () {},
          ),
        ),
        Container(
          child: FloatingActionButton(
            heroTag: "btnStop",
            mini: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange,
            child: Icon(Icons.stop),
            onPressed: () {},
          ),
        ),
      ],
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

  Container _buildInfoTexts() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Distancia: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                  nLinhas: 1,
                ),
              ),
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Velocidade: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                  nLinhas: 1,
                ),
              ),
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Tempo: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                  nLinhas: 1,
                ),
              ),
              Expanded(
                child: Editor(
                  //controlador: _controladorDefeito,
                  rotulo: "Inclinaçao: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  desabilitado: true,
                  nLinhas: 1,
                ),
              ),
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
