import 'package:flutter/material.dart';
import 'package:hcslzapp/http/webclients/associado_webclient.dart';
import 'package:hcslzapp/screens/login/preview.dart';

import 'http/webclients/mensalidade_webclient.dart';
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

/*
executar emulador via terminal:
N
flutter emulators --launch Nexus_5X_API_29_x86
*/

const _tituloAppBar = 'HCSlz App';
final AssociadoWebClient _webClient1 = AssociadoWebClient();
final MensalidadeWebClient _webClient2 = MensalidadeWebClient();

void main() => runApp(HCSlzApp());

class HCSlzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //_webClient2.findByAssociado_Codigo(1);
//    Intl.defaultLocale = 'pt_BR';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Preview(),
      title: _tituloAppBar,
      theme: ThemeData(
        primaryColor: Colors.orange[900],
        hintColor: Colors.black,//grey,
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
