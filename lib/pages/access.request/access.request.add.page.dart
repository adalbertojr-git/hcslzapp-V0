import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';

const String _title = 'Primeiro acesso?';

class AccessRequestAddPage extends StatefulWidget {
  @override
  _AccessRequestAddPageState createState() => _AccessRequestAddPageState();
}

class _AccessRequestAddPageState extends State<AccessRequestAddPage> {
  AccessRequestController _controller = AccessRequestController();

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
          body: _widgets(_),
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
                  _save();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                        'Atenção: seu cadastro será liberado após análise da ' +
                            'Diretoria. Aguarde contato no grupo oficial do ' +
                            'Harley Club (WhatsApp) ou via email.',
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

  _save() {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content:
                    const Text('Requisição de acesso enviado com sucesso.'),
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
