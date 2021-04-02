import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {

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
          height: 40,
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
              SizedBox(
                height: 40.0,
                child: Container(
                  child: Image.asset('assets/imgs/logo.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
