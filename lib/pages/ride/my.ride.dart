import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hcslzapp/components/input.textfield.dart';

class MyRide extends StatefulWidget {
  const MyRide({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyRideState createState() => _MyRideState();
}

class _MyRideState extends State<MyRide> {
  GoogleMapController mapController;
  double lat = -2.5152639;
  double long = -44.2329928;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        SizedBox(width: 20),
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
                child: InputTextField(
                  //controlador: _controladorDefeito,
                  helper: "Distancia: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  disabled: true,
                  nLines: 1,
                ),
              ),
              Expanded(
                child: InputTextField(
                  //controlador: _controladorDefeito,
                  helper: "Velocidade: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  disabled: true,
                  nLines: 1,
                ),
              ),
              Expanded(
                child: InputTextField(
                  //controlador: _controladorDefeito,
                  helper: "Tempo: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  disabled: true,
                  nLines: 1,
                ),
              ),
              Expanded(
                child: InputTextField(
                  //controlador: _controladorDefeito,
                  helper: "Inclinaçao: ", //_rotuloDefeito,
                  inputType: TextInputType.text,
                  disabled: true,
                  nLines: 1,
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
