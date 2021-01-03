import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/login.controller.dart';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';
import 'package:asuka/asuka.dart' as asuka;

class ForgotPassword extends StatelessWidget {
  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    _controller.init;
    return Scaffold(
      body: _forgotPassword(context),
    );
  }

  _forgotPassword(BuildContext context) => Container(
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
              TopMargin(),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                    text:
                    'Atenção: para redefinir sua senha, informe seu email cadastrado. '
                    'Você receberá uma senha provisória para posterior alteração.',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
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
            content: Text("Senha provisória enviada."),
          ));
          Navigator.of(context).pop();
        });
  }
}
