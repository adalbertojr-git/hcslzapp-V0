import 'package:flutter/material.dart';

const String _pathLogo = 'assets/imgs/logo.png';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;

  MyAppBar(this._title);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          _title,
          style: TextStyle(fontSize: 12.0),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            height: 10.0,
            child: Image.asset(_pathLogo),
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
