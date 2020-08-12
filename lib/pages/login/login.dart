import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/hc.logo.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';

const _tituloAppBar = 'HCSlz App';
const _labelUser = 'Usuario ou email';
const _tipUser = 'Digite seu usuario ou email';
const _labelPsw = 'Senha';
const _tipPsw = 'Digite sua senha';

class Login extends StatelessWidget {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPsw = TextEditingController();

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
                  controlller: _controllerUser,
                  label: _labelUser,
                  tip: _tipUser,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controlller: _controllerPsw,
                  label: _labelPsw,
                  tip: _tipPsw,
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
