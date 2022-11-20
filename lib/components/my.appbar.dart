import 'package:flutter/material.dart';

import '../controllers/app.controller.dart';

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
          GestureDetector(
            child: Icon(
              AppController.instance.isDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: AppController.instance.isDarkTheme
                  ? Colors.white
                  : Colors.black,
            ),
            onTap: () {
              AppController.instance.changeTheme();
            },
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
