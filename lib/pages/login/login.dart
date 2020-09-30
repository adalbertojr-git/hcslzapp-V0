import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/hc.logo.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';
import 'dart:async';

const _labelUser = 'Usuario ou email';
const _tipUser = 'Digite seu usuario ou email';
const _labelPsw = 'Senha';
const _tipPsw = 'Digite sua senha';
const _labelName = 'Nome *';
const _labelPhone = 'Telefone *';
const _labelEmail = 'Email *';

class Login extends StatelessWidget {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPsw = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                HcLogo(0.0),
                Tabs(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Tabs(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white10,
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 335,
                  child: IconTheme(
                    data: IconThemeData(
                      size: 128.0,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        TabLogin(context),
                        TabRequestAccess(context),
                        TabForgotPassword(context),
                      ],
                    ),
                  ),
                ),
                TabPageSelector(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TabLogin(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
    );
  }

  Widget TabRequestAccess(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Solicitar cadastro',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InputTextField(
            controlller: _controllerName,
            label: _labelName,
            icon: Icons.person,
            inputType: TextInputType.text,
          ),
          InputTextField(
            controlller: _controllerEmail,
            label: _labelEmail,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
          ),
          InputTextField(
            controlller: _controllerPhone,
            label: _labelPhone,
            icon: Icons.phone,
            inputType: TextInputType.phone,
          ),
          SnackBarWidget(),
        ],
      ),
    );
  }

  Widget TabForgotPassword(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Esqueci minha senha',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InputTextField(
            controlller: _controllerEmail,
            label: _labelEmail,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
          ),
          SnackBarWidget(),
        ],
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

class SnackBarWidget extends StatelessWidget {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Button(Icons.send, onClick: () {
      final snackBar = SnackBar(
        content: Text('Solicitaçao enviada. '
            'Aguarde email com instruçoes de acesso.'),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 5),
        //animation,
      );
      Scaffold.of(context).showSnackBar(snackBar);
      //_setTimer(context);
    });
  }

  void _setTimer(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Navigator.pop(context);
    });
  }
}
