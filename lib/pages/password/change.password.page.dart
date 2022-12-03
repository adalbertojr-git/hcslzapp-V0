import 'package:asuka/asuka.dart' as asuka;
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/change.password.controller.dart';
import 'package:hcslzapp/models/password.dto.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Alterar Senha';

class ChangePasswordPage extends StatelessWidget {
  final PasswordDTO _passwordDTO;
  final ChangePasswordController _controller = ChangePasswordController();

  ChangePasswordPage(this._passwordDTO);

  @override
  Widget build(BuildContext context) {
    _controller.init();
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar: MyBottomAppBar(),
          body: _widgets(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Button(
            icon: Icons.save,
            onClick: () => _update(context),
          ),
        );
      },
    );
  }

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
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
        ],
      );

  _update(BuildContext context) {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Corrija os erros informados').show();
    } else {
      _controller
          .update(
        PasswordDTO(
          associatedId: _passwordDTO.associatedId,
          aux: _controller.pswCtrl.text,
        ),
      )
          .then(
        (value) {
          if (value != null) {
            AsukaSnackbar.success('Senha alterada com sucesso').show();
            Navigator.of(context).pop();
          } else {
            AsukaSnackbar.alert(_controller.errorMsg).show();
          }
        },
      );
    }
  }
}
