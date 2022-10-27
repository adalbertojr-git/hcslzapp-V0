import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/change.password.controller.dart';

const String _title = 'Alterar Senha';

class ChangePasswordPage extends StatefulWidget {
  final String _action;

  ChangePasswordPage(this._action);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  ChangePasswordController _controller = ChangePasswordController();

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
              widget._action == 'CHANGE' ? MyTextFormField(
                textEditingController: _controller.currentPswCtrl,
                hint: hintCurrentPsw,
                label: labelCurrentPsw,
                icon: Icons.password,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changeCurrentPassword,
                errorText: _controller.validateCurrentPassword(),
              ): Container(),
              MyTextFormField(
                textEditingController: _controller.pswCtrl,
                label: labelNewPsw,
                hint: hintNewPsw,
                icon: Icons.password,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changePassword,
                errorText: _controller.validateNewPassword(),
              ),
              MyTextFormField(
                textEditingController: _controller.confPswCtrl,
                label: labelConfirmNewPsw,
                hint: hintConfirmNewPsw,
                icon: Icons.password,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changeConfPassword,
                errorText: _controller.validateConfNewPassword(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Button(
                icon: Icons.save,
                onClick: () {
                  _update();
                },
              ),
            ],
          ),
        ),
      );

  _update() {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.update(_controller.pswCtrl.text).then(
        (value) {
          if (value != null) {
            asuka.showSnackBar(
              SnackBar(
                content:
                    const Text('Alteração de senha realizada com sucesso.'),
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
