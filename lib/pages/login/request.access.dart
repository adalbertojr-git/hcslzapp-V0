import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/request.access.controller.dart';
import 'package:asuka/asuka.dart' as asuka;

class RequestAccess extends StatefulWidget {
  @override
  _RequestAccessState createState() => _RequestAccessState();
}

class _RequestAccessState extends State<RequestAccess> {
  RequestAccessController _controller = RequestAccessController();

  @override
  void initState() {
    _controller.init;
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
              TopMargin(),
              InputTextField(
                textEditingController: _controller.nameReqAccessCtrl,
                hint: hintName,
                label: labelName,
                icon: Icons.person_add,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeName,
                errorText: _controller.validateName(),
              ),
              InputTextField(
                textEditingController: _controller.userReqAccessCtrl,
                hint: hintUser,
                label: labelUser,
                icon: Icons.account_circle_outlined,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeUser,
                errorText: _controller.validateUser(),
              ),
              InputTextField(
                textEditingController: _controller.emailReqAccessCtrl,
                hint: hintEmail,
                label: labelEmail + " *",
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeEmail,
                errorText: _controller.validateEmail(),
              ),
              InputTextField(
                textEditingController: _controller.confEmailReqAccessCtrl,
                hint: hintConfEmail,
                label: labelConfEmail,
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeConfEmail,
                errorText: _controller.validateConfEmail(),
              ),
              InputTextField(
                textEditingController: _controller.pswReqAccessCtrl,
                label: labelPswReqAccess,
                hint: hintPswReqAccess,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changePassword,
                errorText: _controller.validatePassword(),
              ),
              InputTextField(
                textEditingController: _controller.confPswReqAccessCtrl,
                label: labelConfPswReqAccess,
                hint: hintConfPswReqAccess,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changeConfPassword,
                errorText: _controller.validateConfPassword(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Button(
                icon: Icons.app_registration,
                onClick: () {
                  //_login(context);
                },
              ),
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
