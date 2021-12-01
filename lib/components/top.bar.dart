import 'package:flutter/material.dart';

const String _pathLogo = 'assets/imgs/logo.png';

class TopBar extends StatelessWidget {
  final String title;

  TopBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
          width: double.infinity,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 35,
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
                ),
              ),
              this.title != null
                  ? Text(
                      this.title,
                      style: TextStyle(fontSize: 14.0,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 35.0,
                child: Container(
                  child: Image.asset(_pathLogo),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
