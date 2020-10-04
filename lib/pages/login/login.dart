import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcslzapp/components/button.dart';
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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
/*                SizedBox (
                  height: 30.0,
                ),
                SizedBox(
                  height: 180.0,
                  child: Image.asset('assets/imgs/logo.png'),
                ),*/
                Container(
                  width: MediaQuery.of(context).size.width, //double.infinity,
                  height: 210,
                  child: FlareActor(
                    'assets/anims/splash.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    isPaused: false,
                    animation: 'animation-hc',
                  ),
                ),
                Tabs(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Tabs(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 260, //330,
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
                TabPageSelector(
                  selectedColor: Colors.black,
                ),
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
                fontSize: 20.0,
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
                fontSize: 20.0,
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
                fontSize: 20.0,
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
          //SnackBarWidget(),
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
        content: Text('Cadastro enviado para apreciaçao. \n'
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
