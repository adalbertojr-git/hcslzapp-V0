import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  final String heroTag;
  final bool mini;

  Button({this.icon, this.heroTag, @required this.onClick, this.mini = false});

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        mini: mini,
        heroTag: heroTag,
        backgroundColor: Colors.black,
        //backgroundColor: Colors.deepOrangeAccent[100],
        child: Icon(
          icon,
          color: Colors.deepOrangeAccent[100],
          //color: Colors.black,
          size: 35,
        ),
        onPressed: () async {
          onClick();
        },
      );
}
