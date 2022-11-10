import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/app.controller.dart';

//const String _pathLogo = 'assets/imgs/logo.png';
const String _labelDarkTheme = 'Tema Escuro';

class TopBar extends StatelessWidget {
  final String? title;

  TopBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.0,
          width: double.infinity,
        ),
        Container(
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
/*              SizedBox(
                height: 40.0,
                child: Container(
                  child: Image.asset(_pathLogo),
                ),
              ),*/
              Container(
                child: PopupMenuButton<String?>(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _labelDarkTheme,
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Container(
                              child: Switch(
                                activeColor: Colors.orangeAccent,
                                value: AppController.instance.isDarkTheme,
                                onChanged: (value) {
                                  AppController.instance.changeTheme();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
