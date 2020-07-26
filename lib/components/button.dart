/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria um objeto RaisedButton padrao

*/
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String _rotulo;
  final IconData _icone;
  final Function onClick;

  Botao(this._rotulo, this._icone, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 50.0,
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white30),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _rotulo + "  ",
                style: TextStyle(color: Colors.black, fontSize: 17.0),
              ),
              Icon(
                _icone,
                color: Colors.white30,
                size: 30,
              ),
            ],
          ),
        ),

        onPressed: () async {
          onClick();
        },
      ),
    );
  }

}
