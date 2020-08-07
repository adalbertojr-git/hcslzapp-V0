import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/hc.logo.dart';
import 'package:hcslzapp/pages/associated/associated.request.access.dart';

import 'login.dart';

const _rotuloNaoSouAssociado = 'Primeiro acesso?';

class Splash extends StatelessWidget {
  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white30, Colors.deepOrange],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HcLogo(40.0),
                    Text(
                      'Versao: 1.0.0'
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Button(
                      'ACESSAR',
                      Icons.arrow_forward,
                      onClick: () {
                        _showLoginPage(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    FlatButton(
                      child: Text(
                        _rotuloNaoSouAssociado,
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
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
        return AssociatedRequestAccess();
      }),
    );
  }
}
