import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:hcslzapp/repositories/change.password.repo.dart';
import 'package:mobx/mobx.dart';

part 'forgot.password.controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  var formController;

  @observable
  var pswCtrl = TextEditingController();

  @observable
  var confPswCtrl = TextEditingController();

  @observable
  ChangePasswordRepo _changePasswordRepo = ChangePasswordRepo();

  init() {
    formController = FormController(confPassword: '', password: '');
  }

  @action
  Future<String> update(PasswordDTO passwordDTO) =>
      _changePasswordRepo.reset(passwordDTO);

  bool get hasErrors => hasErrorPassword || hasErrorConfPassword;

  bool get hasErrorPassword => validatePassword() != null;

  bool get hasErrorConfPassword => validateConfPassword() != null;

  String? validatePassword() {
    const String _labelPswRequired = 'Nova senha é obrigatória!!!';
    const String _labelPswLenght =
        'Nova senha deve ter no mínimo 6 caracteres!!!';
    const String _labelPswNotValid = 'Informe uma nova senha válida!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 6) {
      return _labelPswLenght;
    } else if (!RegExp(
            r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{6,}$")
        .hasMatch(formController.password)) {
      return _labelPswNotValid;
    }
    return null;
  }

  String? validateConfPassword() {
    const String _labelConfPswRequired =
        'Confirmação da nova senha é obrigatória!!!';
    const String _labelPswNotValid = 'Senhas informadas não conferem!!!';

    if (formController.confPassword.isEmpty) {
      return _labelConfPswRequired;
    } else if (formController.confPassword != formController.password) {
      return _labelPswNotValid;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? confPassword,
    String? password,
  }) {
    super.password = password;
    super.confPassword = confPassword;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? password;

  @observable
  String? confPassword;

  @action
  changePassword(String value) => password = value;

  @action
  changeConfPassword(String value) => confPassword = value;
}
