import 'package:flutter/material.dart';
import 'package:glutton/glutton.dart';

const String _labelDarkTheme = 'darkTheme';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();
  bool isDarkTheme = false;

  Future<void> loadTheme() async {
    isDarkTheme = await Glutton.vomit(_labelDarkTheme) ?? false;
  }

  changeTheme () {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
    Glutton.eat(_labelDarkTheme, isDarkTheme);
  }
}