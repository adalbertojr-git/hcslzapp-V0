import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/password.dto.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../controllers/forgot.password.controller.dart';
import '../../http/http.exception.dart';

const String _title = 'Alterar Senha';

class ForgotPasswordPage extends StatefulWidget {
  final PasswordDTO _passwordDTO;

  ForgotPasswordPage(this._passwordDTO);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final ForgotPasswordController _controller = ForgotPasswordController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Button(
          icon: Icons.save,
          onClick: () => _reset(),
        ),
      );

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) => MyTextFormField(
              textEditingController: _controller.pswCtrl,
              label: labelNewPsw,
              hint: hintNewPsw,
              icon: Icons.password,
              inputType: TextInputType.text,
              hidden: true,
              onChanged: _controller.formController.changePassword,
              errorText: _controller.validatePassword(),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Requisitos:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('* Mínimo de 6 caracteres'),
                Text('* Pelo menos 1 número'),
                Text('* Pelo menos 1 letra maiúscula'),
                Text('* Pelo menos 1 letra minúscula'),
                Text('* Pelo menos 1 caracter espceial: \$*&@#'),              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Observer(
            builder: (_) => MyTextFormField(
              textEditingController: _controller.confPswCtrl,
              label: labelConfirmNewPsw,
              hint: hintConfirmNewPsw,
              icon: Icons.password,
              inputType: TextInputType.text,
              hidden: true,
              onChanged: _controller.formController.changeConfPassword,
              errorText: _controller.validateConfPassword(),
            ),
          ),
        ],
      );

  _reset() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        await _controller.update(
          PasswordDTO(
            associatedId: widget._passwordDTO.associatedId,
            psw: _controller.pswCtrl.text,
            aux: '',
          ),
        );
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.of(context).pop();
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
