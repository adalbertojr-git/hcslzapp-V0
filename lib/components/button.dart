import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  final String heroTag;

  Button({this.icon, this.heroTag, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: Colors.black,
        //backgroundColor: Colors.deepOrangeAccent[100],
        child: Icon(
          icon,
          color: Colors.deepOrangeAccent[100],
          //color: Colors.black,
          size: 40,
        ),
        onPressed: () async {
          onClick();
        },
      ),
    );
  }
}
