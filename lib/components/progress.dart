import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
//import 'package:splashscreen/splashscreen.dart';

const String _pathFlareActor = 'assets/anims/splash.flr';

class Progress extends StatelessWidget {
  final String message;

  Progress({this.message = 'Carregando...'});

  @override
  Widget build2(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              height: 20.0,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //_splashScreen(),
        _animation(),
      ],
    );
  }

/*  _splashScreen() => SplashScreen(
    seconds: 5,
    gradientBackground: LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [Colors.white30, Colors.deepOrange],
    ),
    //navigateAfterSeconds: LoginPage(),
    loaderColor: Colors.transparent,
  );*/

  _animation() => Center(
    child: Container(
      width: double.infinity,
      height: 300,
      child: FlareActor(
        _pathFlareActor,
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        isPaused: false,
        animation: 'animation-hc',
      ),
    ),
  );
}
