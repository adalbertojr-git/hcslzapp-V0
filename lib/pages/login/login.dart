import 'package:flutter/material.dart';
import 'package:hcslzapp/components/appBar.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/logo.dart';
import 'package:hcslzapp/components/text.field.dart';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';

const _tituloAppBar = 'HCSlz App';
const _rotuloUser = 'Usuario ou email';
const _dicaUser = 'Digite seu usuario ou email';
const _rotuloPsw = 'Senha';
const _dicaPsw = 'Digite sua senha';

class Login extends StatelessWidget {
  final TextEditingController _controladorUser = TextEditingController();
  final TextEditingController _controladorPsw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_tituloAppBar),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(
                  controlador: _controladorUser,
                  rotulo: _rotuloUser,
                  dica: _dicaUser,
                  icone: Icons.person,
                  inputType: TextInputType.text,
                ),
                Editor(
                  controlador: _controladorPsw,
                  rotulo: _rotuloPsw,
                  dica: _dicaPsw,
                  icone: Icons.vpn_key,
                  inputType: TextInputType.text,
                  oculto: true,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Botao(
                  'LOGIN',
                  Icons.add_to_home_screen,
                  onClick: () {
                    _showDashboardPage(context);
                  },
                ),
                Logo(0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDashboardPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Dashboard();
      }),
    );
  }
}
