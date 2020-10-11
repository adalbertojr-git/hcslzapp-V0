import 'package:flutter/material.dart';
import 'package:hcslzapp/http/webclients/associated.webclient.dart';
import 'package:hcslzapp/pages/login/login.dart';
import 'package:hcslzapp/pages/login/splash.dart';
import 'package:hcslzapp/pages/login/splash.dart';

import 'http/webclients/payment.webclient.dart';
/*
Atalhos uteis:

Ctrl + Shift + f12 = maximiza editor
Ctrl + \ = hot reload
Ctrl + Alt + l = autoidenta linhas
Ctrl + q = exibe propriedades do objeto
Ctrl + p = exibe lista de parametros
Shift + F6 =  faz com que uma alteração feita em um campo seja refletida em
todos os pontos em que ele aparece
Shift + F10 = reinicia execuçao do app (Run)
Ctrl Alt + M = cria um metodo a partir de um trecho selecionado

Ctrl + N = navega entre todas as classes do projeto
Shift Shift (pressionar 2x) = navega entre todos os objetos do projeto
*/

/* TERMINAL

>>>> executar emulador:
flutter emulators --launch Nexus_5X_API_29_x86

>>>> criar icone da aplicaçao:
flutter pub run flutter_launcher_icons:main
*/

const _titleAppBar = 'HCSlz App';
final AssociatedWebClient _webClient1 = AssociatedWebClient();
final PaymentWebClient _webClient2 = PaymentWebClient();

void main() => runApp(HCSlzApp());

class HCSlzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //_webClient2.findByAssociado_Codigo(1);
//    Intl.defaultLocale = 'pt_BR';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(), //Login(), //Splash(),
      title: _titleAppBar,
      theme: ThemeData(
        primaryColor: Colors.blue,//orange[900],
        hintColor: Colors.black,
/*
        accentColor: Colors.orange[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
        ),
*/
      ),
    );
  }
}
