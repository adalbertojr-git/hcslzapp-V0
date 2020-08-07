/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria uma tela de mensagem padrao

*/
import 'package:flutter/material.dart';

import 'hc.logo.dart';

class CenteredMessage extends StatelessWidget {
  final String _message;
  final IconData icon;
  final double _iconSize = 64;
  final double _fontSize = 20;

  CenteredMessage(
    this._message, {
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HcLogo(0.0),
          /*
          permite configurar se o Widget sera visivel ou nao
          */
          Visibility(
            child: Icon(
              icon,
              size: _iconSize,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              _message,
              style: TextStyle(fontSize: _fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
