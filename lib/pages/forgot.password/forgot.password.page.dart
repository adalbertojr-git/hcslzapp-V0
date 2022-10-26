import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/forgot.password.controller.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
                      fontSize: 14.0,
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
/*    _controller
        .forgotPassword(_controller.emailForgotPswCtrl.text)
        .then((value) {
      asuka.showSnackBar(
        SnackBar(
          content: Text(value.toString()),
        ),
      );
    });*/
    _controller.initTextFields();
    _showCodedDialog();
  }

  _showCodedDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.deepOrange[200],
              content: MyTextFormField(
                textEditingController: _controller.codeCtrl,
                label: labelCode,
                hint: hintCode,
                fontSize: 22,
                maxLength: 6,
                inputType: TextInputType.number,
                maskTextInputFormatter: MaskTextInputFormatter(mask: "######"),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: FloatingActionButton(
                        heroTag: 'btnCancel',
                        mini: true,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.deepOrangeAccent[100],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: FloatingActionButton(
                        heroTag: 'btnSend',
                        mini: true,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.deepOrangeAccent[100],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ));
  }
}
