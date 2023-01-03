import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/change.password.controller.dart';
import '../../common/injection.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../models/associated.dart';
import '../../models/password.dto.dart';

const String _title = 'Alterar Senha';

class ChangePasswordPage extends StatefulWidget {

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

  class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final Associated _associated = locator.get<Associated>();
  final ChangePasswordController _controller = ChangePasswordController();

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
          onClick: () => _change(),
        ),
      );

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.pswCtrl,
                label: labelCurrentPsw,
                hint: hintCurrentPsw,
                icon: Icons.password,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changePassword,
                errorText: _controller.validatePassword(),
              );
            }
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.newPswCtrl,
                label: labelNewPsw,
                hint: hintNewPsw,
                icon: Icons.password,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changeNewPassword,
                errorText: _controller.validateNewPassword(),
              );
            }
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.confPswCtrl,
                label: labelConfirmNewPsw,
                hint: hintConfirmNewPsw,
                icon: Icons.password,
                inputType: TextInputType.text,
                hidden: true,
                onChanged: _controller.formController.changeConfPassword,
                errorText: _controller.validateConfPassword(),
              );
            }
          ),
        ],
      );

  _change() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        await _controller.change(
          PasswordDTO(
            associatedId: _associated.id,
            psw: _controller.pswCtrl.text,
            aux: _controller.newPswCtrl.text,
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
