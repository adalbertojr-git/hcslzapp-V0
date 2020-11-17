import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/associated.controller.dart';
import 'package:hcslzapp/pages/login/splash.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'controllers/dependent.controller.dart';

const _titleAppBar = 'HCSlz App';

void main() => runApp(HCSlzApp());

class HCSlzApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //Intl.defaultLocale = 'pt_BR';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AssociatedController>.value(value: AssociatedController()),
        ChangeNotifierProvider<DependentController>.value(value: DependentController()),
      ],
      child: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
            title: _titleAppBar,
            theme: ThemeData(
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
              //primaryColor: Colors.blue,//orange[900],
              //hintColor: Colors.black,
/*
            accentColor: Colors.orange[700],
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.white,
              textTheme: ButtonTextTheme.primary,
            ),
*/
            ),
          );
        },
      ),
    );
  }
}
