import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData _icon;
  final Function onClick;

  Button(this._icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        //backgroundColor: Colors.deepOrangeAccent[100],
        child: Icon(
          _icon,
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
