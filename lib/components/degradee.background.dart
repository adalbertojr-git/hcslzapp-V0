import 'package:flutter/material.dart';

import '../controllers/app.controller.dart';

class DegradeBackground extends StatelessWidget {
  final Widget _widget;

  DegradeBackground(this._widget);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppController.instance.isDarkTheme ? Colors.black26 : Colors.white,
              Colors.deepOrange
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: _widget,
      );
}
