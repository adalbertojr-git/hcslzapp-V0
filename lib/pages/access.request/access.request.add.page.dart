import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';
import '../../components/my.appbar.dart';
import '../../controllers/app.controller.dart';

const String _title = 'Solicitar acesso';

class AccessRequestAddPage extends StatefulWidget {
  @override
  _AccessRequestAddPageState createState() => _AccessRequestAddPageState();
}

class _AccessRequestAddPageState extends State<AccessRequestAddPage> {
  final AccessRequestController _controller = AccessRequestController();
  int _selectedIndex = 0;

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          body: _widgets(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.deepOrange[300],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                label: 'Voltar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: 'Salvar',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  AppController.instance.isDarkTheme
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: AppController.instance.isDarkTheme
                      ? Colors.white
                      : Colors.black,
                ),
                label: 'Tema',
              )
            ],
          ),
/*          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Button(
            icon: Icons.save,
            onClick: () {
              if (!_controller.hasErrors)
                _save();
              else
                AsukaSnackbar.alert('Corrija os erros informados').show();
            },
          ),*/
        ),
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0)
      Navigator.of(context).pop();
    else if (index == 1) _save();
    else AppController.instance.changeTheme();
  }

  _widgets() => ListView(
        children: <Widget>[
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
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            onChanged: _controller.formController.changeEmail,
            errorText: _controller.validateEmail(),
          ),
          MyTextFormField(
            textEditingController: _controller.confEmailCtrl,
            hint: hintConfEmail,
            label: labelConfEmail,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            onChanged: _controller.formController.changeConfEmail,
            errorText: _controller.validateConfEmail(),
          ),
          MyTextFormField(
            textEditingController: _controller.pswCtrl,
            label: labelPswAccessReq,
            hint: hintPswAccessReq,
            icon: Icons.password,
            inputType: TextInputType.text,
            hidden: true,
            onChanged: _controller.formController.changePassword,
            errorText: _controller.validatePassword(),
          ),
          MyTextFormField(
            textEditingController: _controller.confPswCtrl,
            label: labelConfPswAccessReq,
            hint: hintConfPswAccessReq,
            icon: Icons.password,
            inputType: TextInputType.text,
            hidden: true,
            onChanged: _controller.formController.changeConfPassword,
            errorText: _controller.validateConfPassword(),
          ),
        ],
      );

  _save() {
    if (_controller.hasErrors) {
      Asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      _controller.save().then(
        (value) {
          if (value != null) {
            Asuka.showSnackBar(
              SnackBar(
                content:
                    const Text('Requisição de acesso enviado com sucesso.'),
              ),
            );
            Navigator.of(context).pop();
          } else {
            Asuka.showSnackBar(
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
