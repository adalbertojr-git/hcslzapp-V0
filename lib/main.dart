import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/pages/splash/splash.page.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_localizations/flutter_localizations.dart';

const _titleAppBar = 'HCSlz App';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await AppController.instance.loadTheme();
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
          builder: asuka.builder,
          debugShowCheckedModeBanner: false,
          home: Splash(),
          title: _titleAppBar,
          theme: ThemeData(
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
            accentColor: Colors.indigo,
          ),
        );
      },
    );
  }

/*  void testToken() {
    String token =
        'eyJhbGciOiJIUzUxMiJ9.eyJhc3NvY2lhdGVkSWQiOjEsInN1YiI6ImF0YWpyIiwiZXhwIjoxNjEwNTg3NjUxLCJpYXQiOjE2MTA1Njk2NTF9.e8OIa6r6h4JuMJhxIilo3QO7LKGbCjlr32iyQWN4QnXW-2TFkwZSRvNbr6hwCVcbgP6bjjhpxI5pED3Qd608Wg';
    // To decode the token
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    // Print the payload
    print("payload: $payload");

    // Print one of its property(example: email):
    //print(payload['email']);

//   To get expiry date
    DateTime expiryDate = Jwt.getExpiryDate(token);
//   Print the expiry date
    print("expiryDate: $expiryDate");

    // To check if token is expired
    bool isExpired = Jwt.isExpired(token);
    print("isExpired: $isExpired");

    // Can be used for auth state
    if (!isExpired) {
      //   Token isn't expired
    } else {
      //   Token is expired
    }
  }*/

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
