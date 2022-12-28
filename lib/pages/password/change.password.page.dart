import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
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
            label: labelCurrentPsw,
            hint: hintCurrentPsw,
            icon: Icons.password,
            inputType: TextInputType.text,
            hidden: true,
            onChanged: _controller.formController.changePassword,
            errorText: _controller.validatePassword(),
          ),
          MyTextFormField(
            textEditingController: _controller.newPswCtrl,
            label: labelNewPsw,
            hint: hintNewPsw,
            icon: Icons.password,
            inputType: TextInputType.text,
            hidden: true,
            onChanged: _controller.formController.changeNewPassword,
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
            errorText: _controller.validateConfPassword(),
          ),
        ],
      );

  _update(BuildContext context) async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        await _controller.update(
          PasswordDTO(
            associatedId: _passwordDTO.associatedId,
            aux: _controller.pswCtrl.text,
          ),
        );
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.of(context).pop();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
