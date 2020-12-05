import 'package:flutter/material.dart';
import 'hc.logo.dart';

class CenteredMessage extends StatelessWidget {
  final String _message;
  final IconData icon;
  final double _iconSize = 64;
  final double _fontSize = 20;
  final Color backgroundColor;
  final Color fontColor;

  CenteredMessage(
    this._message, {
    this.icon,
    this.backgroundColor = Colors.red,
    this.fontColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30,this.backgroundColor],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      //color: Colors.red[400],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HcLogo(0.0),
            /*
            permite configurar se o Widget sera visivel ou nao
            */
            Visibility(
              child: Icon(
                icon,
                size: _iconSize,
                color: Colors.white,
              ),
              visible: icon != null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: _fontSize,
                  color: this.fontColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
