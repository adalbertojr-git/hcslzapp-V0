import 'package:flutter/material.dart';

const String _pathNoImage = 'assets/imgs/logo.png';

class HcLogo extends StatelessWidget {

  final double _top;

  HcLogo(this._top);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(00.0, _top, 00.0, 0.0),
      child: Image.asset(_pathNoImage),
    );
  }
}
