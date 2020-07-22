/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que insere o logotipo do Harley Club padrao

Params:
_top: distancia do topo da tela (obrigatorio)

*/
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final double _top;

  Logo(this._top);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(00.0, _top, 00.0, 0.0),
      child: Image.asset('assets/imgs/logo.png'),
    );
  }
}
