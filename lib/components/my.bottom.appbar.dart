import 'package:flutter/material.dart';

import '../controllers/app.controller.dart';

class MyBottomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(
                AppController.instance.isDarkTheme
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: AppController.instance.isDarkTheme
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  AppController.instance.changeTheme();
                });
              },
            ),
          ],
        ),
      );
}
