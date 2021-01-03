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

class RequestAccess extends StatelessWidget {
  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    _controller.init;
    return Scaffold(
      body: _requestAccess(context),
    );
  }

  _requestAccess(BuildContext context) => Container(
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
              Observer(builder: (_) {
                return InputTextField(
                  textEditingController: _controller.nameReqAccessCtrl,
                  hint: hintName,
                  label: labelName,
                  icon: Icons.person_add,
                  inputType: TextInputType.text,
                  onChanged: _controller.formController.changeName,
                  errorText: _controller.validateName(),
                );
              }),
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
              InputTextField(
                textEditingController: _controller.emailReqAccessCtrl,
                hint: hintEmail,
                label: labelEmail + " *",
                icon: Icons.check,
                inputType: TextInputType.emailAddress,
              ),
              InputTextField(
                textEditingController: _controller.pswReqAccessCtrl,
                label: labelPswReqAccess,
                hint: hintPswReqAccess,
                icon: Icons.vpn_key,
                inputType: TextInputType.text,
                hidden: true,
              ),
              InputTextField(
                textEditingController: _controller.confPswReqAccessCtrl,
                label: labelConfPswReqAccess,
                hint: hintConfPswReqAccess,
                icon: Icons.check,
                inputType: TextInputType.text,
                hidden: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              SnackBarWidget('btnRequestAccess'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        'Atenção: seu cadastro será analisado e liberado pela Diretoria HC. Você '
                        'receberá um email informando da liberação. Verifique sua caixa '
                        'spam.',
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
            content: Text("Cadastro enviado para apreciação."),
          ));
          Navigator.of(context).pop();
        });
  }
}
