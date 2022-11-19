import 'package:flutter/material.dart';

const String _pathLogo = 'assets/imgs/logo.png';

class TopBar extends StatelessWidget {
  final String? title;

  TopBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35.0,
            ),
          ),
          Text(
            this.title ?? "",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 40.0,
            child: Container(
              child: Image.asset(_pathLogo),
            ),
          ),
        ],
      ),
    );
  }
}
