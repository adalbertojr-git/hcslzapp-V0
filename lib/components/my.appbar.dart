import 'package:flutter/material.dart';

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
/*        actions: [
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
        ],*/
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
