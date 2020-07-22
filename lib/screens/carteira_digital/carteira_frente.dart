import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/components/appBar.dart';

const _tituloAppBar = 'Carteira Digital HCSlz';

class CarteiraDigitalFrente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_tituloAppBar),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: new GestureDetector(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: new Text('Toque duas vezes para ver o verso',
                    style: new TextStyle(fontSize: 12, fontWeight: FontWeight.w600 )),
              ),
              new Container(
                padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: new RotatedBox(
                  quarterTurns: 1,
                  child: new Stack(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          child: new CachedNetworkImage(
                            placeholder: (context, url) => new CircularProgressIndicator(),
                            imageUrl: 'assets/imgs/logo.png',
                            //_usuario.frenteIdentidadeFuncionalUrl,
                            errorWidget: (context, url, error) => Image.asset("assets/imgs/FRENTE_INDISPONIVEL.png"),
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          onDoubleTap: () {

          }
        ),
      ),
    );
  }
}
