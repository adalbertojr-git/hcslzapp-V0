import 'package:flutter/material.dart';

import '../controllers/app.controller.dart';

class MyBottomAppBar extends StatefulWidget with PreferredSizeWidget {
/*  final Icon icon;
  final Function onClick;

  const MyBottomAppBar({
    required this.icon,
    required this.onClick,
  });*/

final Icon icon;

  const MyBottomAppBar({
    required this.icon,
  });


  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        backgroundColor: Colors.deepOrange[300],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Voltar',
          ),
          BottomNavigationBarItem(
            icon: widget.icon,
            label: 'Salvar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AppController.instance.isDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: AppController.instance.isDarkTheme
                  ? Colors.white
                  : Colors.black,
            ),
            label: 'Tema',
          )
        ],
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0)
      Navigator.of(context).pop();
    else if (index == 1)
      print('');
    //widget.onClick();
    else
      AppController.instance.changeTheme();
  }
}
