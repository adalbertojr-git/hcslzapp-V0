import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../login/login.page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        splashScreen,
        animation,
      ],
    );
  }

  get splashScreen => SplashScreen(
        seconds: 6,
        gradientBackground: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [Colors.white30, Colors.deepOrange],
        ),
        navigateAfterSeconds: Login(),
        loaderColor: Colors.transparent,
      );

  get animation => Center(
        child: Container(
          width: double.infinity,
          height: 300,
          child: FlareActor(
            'assets/anims/splash.flr',
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
            isPaused: false,
            animation: 'animation-hc',
          ),
        ),
      );
}
