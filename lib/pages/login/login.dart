import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'dart:async';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';

const _labelUser = 'Usuario ou email';
const _tipUser = 'Digite seu usuario ou email';
const _labelPsw = 'Senha';
const _tipPsw = 'Digite sua senha';
const _labelName = 'Nome *';
const _labelPhone = 'Telefone *';
const _labelEmail = 'Email *';
const _labelSponsor = 'Padrinho *';

class Login extends StatelessWidget {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPsw = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: appBar,
          body: TabBarView(
            children: [
              TabRequestAccess(context),
              TabLogin(context),
              TabForgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  get appBar => AppBar(
        title: Text(
          'HCSlz App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[300],
        toolbarHeight: 150.0,
        elevation: 30.0,
        shadowColor: Colors.deepOrange,
        bottom: tabBar,
      );

  get tabBar => TabBar(
        indicatorColor: Colors.white,
        labelPadding: EdgeInsets.only(bottom: 5.0),
        tabs: [
          Tab(
            icon: Image(
              image: AssetImage('assets/imgs/create_account.png'),
              fit: BoxFit.fill,
            ),
          ),
          Tab(
            icon: Image(
              image: AssetImage('assets/imgs/login.png'),
              fit: BoxFit.fill,
            ),
          ),
          Tab(
            icon: Image(
              image: AssetImage('assets/imgs/forgot_password.png'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      );

  Widget TabLogin(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/imgs/logo_login.png'),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InputTextField(
                  controller: _controllerUser,
                  label: _labelUser,
                  //tip: _tipUser,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controller: _controllerPsw,
                  label: _labelPsw,
                  //tip: _tipPsw,
                  icon: Icons.vpn_key,
                  inputType: TextInputType.text,
                  hidden: true,
                ),
                SizedBox(
                  height: 50.0,
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
      ],
    );
  }

  Widget TabRequestAccess(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Solicitar Cadastro',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            InputTextField(
              controller: _controllerName,
              tip: _labelName,
              valor: _labelName,
              icon: Icons.person,
              inputType: TextInputType.text,
            ),
            InputTextField(
              controller: _controllerEmail,
              tip: _labelEmail,
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
            ),
            InputTextField(
              controller: _controllerPhone,
              tip: _labelPhone,
              icon: Icons.phone,
              inputType: TextInputType.phone,
            ),
            InputTextField(
              //controller: associatedBloc.sponsorCtrl,
              tip: _labelSponsor,
              icon: Icons.person_pin,
              inputType: TextInputType.text,
            ),
            SnackBarWidget(),
          ],
        ),
      ),
    );
  }

  Widget TabForgotPassword(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Esqueci minha senha',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            InputTextField(
              controller: _controllerEmail,
              label: _labelEmail,
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
            ),
            SnackBarWidget(),
          ],
        ),
      ),
    );
  }

  _showDashboardPage(BuildContext context) {
    Navigator.pushReplacement(
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
    return Button(Icons.email_rounded, onClick: () {
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

  _setTimer(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Navigator.pop(context);
    });
  }
}
