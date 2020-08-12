import 'package:flutter/material.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/hc.logo.dart';
import 'package:hcslzapp/pages/associated/associated.request.access.dart';

import 'login.dart';

const _labelFirstAccess = 'Primeiro acesso?';
const _labelAppTitle = 'HCSlz App';
const _labelAppVersion = 'Versão: 1.0.0';

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
                    HcLogo(30.0),
                    Text(
                      _labelAppTitle,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      _labelAppVersion,
                      style: TextStyle(
                          fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Button(
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
                        _labelFirstAccess,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _showAssociatedRequestAccessPage(context);
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

  void _showAssociatedRequestAccessPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AssociatedRequestAccess();
      }),
    );
  }
}
