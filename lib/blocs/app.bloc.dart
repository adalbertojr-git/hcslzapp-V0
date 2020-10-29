import 'package:flutter/material.dart';

class AppBloc extends ChangeNotifier {

  static AppBloc instance = AppBloc();
  bool isDarkTheme = false;

  changeTheme () {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}