import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/hc.logo.dart';
import 'package:hcslzapp/components/input.textfield.dart';
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
     // appBar: MyAppBar(_tituloAppBar),
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
                HcLogo(30.0),
                InputTextField(
                  controlller: _controladorUser,
                  label: _rotuloUser,
                  tip: _dicaUser,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controlller: _controladorPsw,
                  label: _rotuloPsw,
                  tip: _dicaPsw,
                  icon: Icons.vpn_key,
                  inputType: TextInputType.text,
                  hidden: true,
                ),
                Button(
                  Icons.arrow_forward,
                  onClick: () {
                    _showDashboardPage(context);
                  },
                ),

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
