/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria um objeto AppBar padrao

Params:
_tituloAppBar: titulo exibido na AppBar (obrigatorio)

*/
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _tituloAppBar;

  MyAppBar(this._tituloAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        _tituloAppBar,
        style: TextStyle(color: Colors.orange),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
