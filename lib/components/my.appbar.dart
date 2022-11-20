import 'package:flutter/material.dart';

const String _pathLogo = 'assets/imgs/logo.png';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;

  MyAppBar(this._title);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: Container(),
        title: Text(
          _title,
        ),
        centerTitle: true,
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(_pathLogo),
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
