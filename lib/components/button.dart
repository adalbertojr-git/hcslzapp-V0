/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria um objeto RaisedButton padrao

*/
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData _icon;
  final Function onClick;

  Button(this._icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      //padding: EdgeInsets.only(bottom: 3.0),
      //alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(color: Colors.white30),
        ),
        child: Icon(
          _icon,
          color: Colors.black,
          size: 40,
        ),
        onPressed: () async {
          onClick();
        },
      ),
    );
  }
}
