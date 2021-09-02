import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../login/login.page.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _splashScreen(),
        _animation(),
      ],
    );
  }

  _splashScreen() => SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [Colors.white30, Colors.deepOrange],
        ),
        navigateAfterSeconds: LoginPage(),
        loaderColor: Colors.transparent,
      );

  _animation() => Center(
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
