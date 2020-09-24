import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatelessWidget {
  Future delay(context) async {
    await Future.delayed(
        Duration(
          milliseconds: 6000,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Login();
        }),
      );
    });
  }

  Widget build(BuildContext context) {
    delay(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: FlareActor(
                  'assets/anims/splash.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                isPaused: false,
                animation: 'animation-hc',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
