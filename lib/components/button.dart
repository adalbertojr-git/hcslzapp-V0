import 'package:flutter/material.dart';
import '../controllers/app.controller.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  final String? heroTag;
  final bool mini;

  Button({
    required this.icon,
    this.heroTag,
    required this.onClick,
    this.mini = false,
  });

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        mini: mini,
        heroTag: heroTag,
        backgroundColor: Colors.deepOrange[300],
        child: Icon(
          icon,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () async {
          onClick();
        },
      );
}
