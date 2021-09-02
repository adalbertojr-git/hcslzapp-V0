import 'package:flutter/material.dart';
import 'package:glutton/glutton.dart';

class AppController extends ChangeNotifier {

  static AppController instance = AppController();
  bool isDarkTheme = false;

  Future<void> loadTheme() async {
    isDarkTheme = await Glutton.vomit("darkTheme") ?? false;
  }

  changeTheme () {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
    Glutton.eat("darkTheme", isDarkTheme);
  }
}