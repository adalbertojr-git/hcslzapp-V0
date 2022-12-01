import 'package:asuka/asuka.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/pages/login/login.page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/injection.dart';

const _titleAppBar = 'HCSlz App';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await AppController.instance.loadTheme();
  setupLocator();
  runApp(HCSlzApp());
}

class HCSlzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('pt_BR', ''), // Portuguese, no country code
          ],
          builder: Asuka.builder,
          navigatorObservers: [
            Asuka.asukaHeroController
            //This line is needed for the Hero widget to work
          ],
          debugShowCheckedModeBanner: false,
          home: MyCustomLoginUI(),
          //home: TableEventsExample(),
          title: _titleAppBar,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.deepOrange[300],
            ),
            bottomAppBarColor: Colors.deepOrange[300],
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
        );
      },
    );
  }
}
