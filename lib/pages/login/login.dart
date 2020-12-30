import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/controllers/login.controller.dart';
import 'dart:async';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';
import 'package:asuka/asuka.dart' as asuka;

class Login extends StatelessWidget {
  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    _controller.init;
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
                  textEditingController: _controller.userLoginCtrl,
                  label: labelUserOrEmail,
                  hint: hintUserOrEmail,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                InputTextField(
                  textEditingController: _controller.pswLoginCtrl,
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
                  icon: Icons.arrow_forward,
                  heroTag: 'btnLogin',
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
            Observer(
              builder: (_) {
                return InputTextField(
                  textEditingController: _controller.nameReqAccessCtrl,
                  hint: hintName,
                  label: labelName,
                  icon: Icons.person_add,
                  inputType: TextInputType.text,
                  onChanged: _controller.formController.changeName,
                  errorText: _controller.validateName(),
                );
              }
            ),
            InputTextField(
              textEditingController: _controller.userReqAccessCtrl,
              hint: hintUser,
              label: labelUser,
              icon: Icons.account_circle_outlined,
              inputType: TextInputType.text,
            ),
            InputTextField(
              textEditingController: _controller.emailReqAccessCtrl,
              hint: hintEmail,
              label: labelEmail + " *",
              icon: Icons.attach_email,
              inputType: TextInputType.emailAddress,
            ),
            Row(
              children: [
                Expanded(
                  child: InputTextField(
                    textEditingController: _controller.pswReqAccessCtrl,
                    label: labelPswReqAccess,
                    hint: hintPswReqAccess,
                    inputType: TextInputType.text,
                    hidden: true,
                  ),
                ),
                Expanded(
                  child: InputTextField(
                    textEditingController: _controller.confPswReqAccessCtrl,
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
            SnackBarWidget('btnRequestAccess'),
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
              textEditingController: _controller.emailForgotPswCtrl,
              hint: hintEmail,
              label: labelEmail + " *",
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10.0,
            ),
            SnackBarWidget('btnForgotPassword'),
          ],
        ),
      ),
    );
}

class SnackBarWidget extends StatelessWidget {
  String heroTag;

  SnackBarWidget(this.heroTag);

  @override
  Widget build(BuildContext context) {
    return Button(
        icon: Icons.email_rounded,
        heroTag: heroTag,
        onClick: () {
          asuka.showSnackBar(SnackBar(
            content: Text("Hello World"),
          ));
        });
  }
}
