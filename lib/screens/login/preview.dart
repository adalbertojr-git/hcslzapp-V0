import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/logo.dart';
import 'package:hcslzapp/screens/associado/solicitar_acesso_associado.dart';

import 'login.dart';

const _rotuloSouAssociado = 'Membros HCSlz';
const _rotuloNaoSouAssociado = 'Primeiro acesso? Solicite liberaçao';

class Preview extends StatelessWidget {
  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Logo(40.0),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(00.0),
                      child: Text(
                        _rotuloSouAssociado,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Botao(
                      'ACESSAR',
                      Icons.play_arrow,
                      onClick: () {
                        _showLoginPage(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(00.0),
                      child: Text(
                        _rotuloNaoSouAssociado,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Botao(
                      'SOLICITAR',
                      Icons.device_unknown,
                      onClick: () {
                        _showSolicitarAcessoAssociadoPage(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Login();
      }),
    );
  }

  void _showSolicitarAcessoAssociadoPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return SolicitarAcessoAssociado();
      }),
    );
  }
}
