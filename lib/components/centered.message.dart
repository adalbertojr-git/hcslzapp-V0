/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria uma tela de mensagem padrao

*/
import 'package:flutter/material.dart';

import 'logo.dart';

class CenteredMessage extends StatelessWidget {
  final String _message;
  final IconData icon;
  final double iconSize;
  final double fontSize;

  CenteredMessage(
    this._message, {
    this.icon,
    this.iconSize = 64,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Logo(0.0),
          /*
          permite configurar se o Widget sera visivel ou nao
          */
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              _message,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
