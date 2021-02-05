import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';

class AccessRequestAdd extends StatefulWidget {
  @override
  _AccessRequestAddState createState() => _AccessRequestAddState();
}

class _AccessRequestAddState extends State<AccessRequestAdd> {
  AccessRequestController _controller = AccessRequestController();

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
              MyTextFormField(
                textEditingController: _controller.nameCtrl,
                hint: hintName,
                label: labelName,
                icon: Icons.person_add,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeName,
                errorText: _controller.validateName(),
              ),
              MyTextFormField(
                textEditingController: _controller.userCtrl,
                hint: hintUser,
                label: labelUser,
                icon: Icons.account_circle_outlined,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeUser,
                errorText: _controller.validateUser(),
              ),
              MyTextFormField(
                textEditingController: _controller.emailCtrl,
                hint: hintEmail,
                label: labelEmail + " *",
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeEmail,
                errorText: _controller.validateEmail(),
              ),
              MyTextFormField(
                textEditingController: _controller.confEmailCtrl,
                hint: hintConfEmail,
                label: labelConfEmail,
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeConfEmail,
                errorText: _controller.validateConfEmail(),
              ),
              MyTextFormField(
                textEditingController: _controller.pswCtrl,
                label: labelPswAccessReq,
                hint: hintPswAccessReq,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changePassword,
                errorText: _controller.validatePassword(),
              ),
              MyTextFormField(
                textEditingController: _controller.confPswCtrl,
                label: labelConfPswAccessReq,
                hint: hintConfPswAccessReq,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changeConfPassword,
                errorText: _controller.validateConfPassword(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Button(
                icon: Icons.send_to_mobile,
                onClick: () {
                  _save;
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

  get _save {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content: Text('Requisição de acesso enviado com sucesso.'),
              ),
            );
            Navigator.of(context).pop();
          } else {
            asuka.showSnackBar(
              SnackBar(
                content: Text(_controller.errorMsg),
              ),
            );
          }
        },
      );
    }
  }
}
