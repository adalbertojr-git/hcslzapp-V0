import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/forgot.password.controller.dart';
import 'package:asuka/asuka.dart' as asuka;

const String _title = 'Esqueceu a senha?';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordController _controller = ForgotPasswordController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: _widgets(context),
        );
      },
    );
  }

  _widgets(BuildContext context) => Container(
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
              TopBar(
                title: _title,
              ),
              MyTextFormField(
                textEditingController: _controller.emailForgotPswCtrl,
                hint: hintEmail,
                label: labelEmail + " *",
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeEmail,
                errorText: _controller.validateEmail(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Button(
                icon: Icons.email,
                onClick: () {
                  _forgotPassword();
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Atenção: Você receberá um email contendo um código de segurança, ' +
                        ' o qual deverá ser informado para geração de nova senha. Caso não ' +
                        ' encontre o email na Caixa de Entrada, verifique sua caixa de Spam.',
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

  _forgotPassword() {
    _controller
        .forgotPassword(_controller.emailForgotPswCtrl.text)
        .then((value) {
      asuka.showSnackBar(
        SnackBar(
          content: Text(value.toString()),
        ),
      );
    });
  }
}
