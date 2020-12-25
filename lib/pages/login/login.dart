import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/controllers/login.controller.dart';
import 'dart:async';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';

class Login extends StatelessWidget {
  LoginController _controller = LoginController();

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
              _tabRequestAccess(context),
              _tabLogin(context),
              _tabForgotPassword(context),
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

  _tabLogin(BuildContext context) => Stack(
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
                  height: 20.0,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InputTextField(
                  controller: _controller.userLoginCtrl,
                  label: labelUserOrEmail,
                  hint: hintUserOrEmail,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  controller: _controller.pswLoginCtrl,
                  label: labelPsw,
                  hint: hintPsw,
                  icon: Icons.vpn_key,
                  inputType: TextInputType.text,
                  hidden: true,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Button(
                  Icons.arrow_forward,
                  onClick: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );

  _tabRequestAccess(BuildContext context) => Container(
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
              height: 20.0,
            ),
            Text(
              'Solicitar Cadastro',
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            InputTextField(
              controller: _controller.nameReqAccessCtrl,
              hint: hintName,
              label: labelName,
              icon: Icons.person_add,
              inputType: TextInputType.text,
            ),
            InputTextField(
              controller: _controller.userReqAccessCtrl,
              hint: hintUser,
              label: labelUser,
              icon: Icons.account_circle_outlined,
              inputType: TextInputType.text,
            ),
            InputTextField(
              controller: _controller.emailReqAccessCtrl,
              hint: hintEmail,
              label: labelEmail + " *",
              icon: Icons.attach_email,
              inputType: TextInputType.emailAddress,
            ),
            Row(
              children: [
                Expanded(
                  child: InputTextField(
                    controller: _controller.pswReqAccessCtrl,
                    label: labelPswReqAccess,
                    hint: hintPswReqAccess,
                    inputType: TextInputType.text,
                    hidden: true,
                  ),
                ),
                Expanded(
                  child: InputTextField(
                    controller: _controller.confPswReqAccessCtrl,
                    label: labelConfPswReqAccess,
                    hint: hintConfPswReqAccess,
                    inputType: TextInputType.text,
                    hidden: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SnackBarWidget(),
          ],
        ),
      ),
    );

  _tabForgotPassword(BuildContext context) => Container(
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
              height: 20.0,
            ),
            Text(
              'Esqueci minha senha',
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            InputTextField(
              controller: _controller.emailForgotPswCtrl,
              hint: hintEmail,
              label: labelEmail + " *",
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
            SnackBarWidget(),
          ],
        ),
      ),
    );
}

class SnackBarWidget extends StatelessWidget {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Button(Icons.email_rounded, onClick: () {
      final snackBar = SnackBar(
        content: Text('Cadastro enviado para apreciação. \n'
            'Aguarde email com instruções de acesso.'),
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
