import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/associated.controller.dart';
import 'package:hcslzapp/pages/login/splash.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:asuka/asuka.dart' as asuka;

const _titleAppBar = 'HCSlz App';

void main() => runApp(HCSlzApp());

class HCSlzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Intl.defaultLocale = 'pt_BR';
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          builder: asuka.builder,
          debugShowCheckedModeBanner: false,
          home: Splash(),
          title: _titleAppBar,
          theme: ThemeData(
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
        );
      },
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    //Intl.defaultLocale = 'pt_BR';
    return MultiProvider(
      providers: [
        Provider<AssociatedController>.value(value: AssociatedController()),
      ],
      child: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            builder: asuka.builder,
            debugShowCheckedModeBanner: false,
            home: Splash(),
            title: _titleAppBar,
            theme: ThemeData(
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
          );
        },
      ),
    );
  }
*/
}
