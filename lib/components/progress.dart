import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:hcslzapp/components/degradee.background.dart';

const String _pathFlareActor = 'assets/anims/splash.flr';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: _animation(),
      );

  _animation() => DegradeBackground(
        FlareActor(
          _pathFlareActor,
          isPaused: false,
          animation: 'animation-hc',
        ),
      );
}
