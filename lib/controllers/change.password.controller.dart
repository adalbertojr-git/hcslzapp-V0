import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:hcslzapp/repositories/change.password.repo.dart';
import 'package:mobx/mobx.dart';

part 'change.password.controller.g.dart';

class ChangePasswordController = ChangePasswordControllerBase
    with _$ChangePasswordController;

abstract class ChangePasswordControllerBase with Store {
  var formController;

  @observable
  var pswCtrl = TextEditingController();

  @observable
  var newPswCtrl = TextEditingController();

  @observable
  var confPswCtrl = TextEditingController();

  @observable
  ChangePasswordRepo _changePasswordRepo = ChangePasswordRepo();

  init() {
    formController = FormController(
      password: '',
      newPassword: '',
      confPassword: '',
    );
  }

  @action
  Future<String> change(PasswordDTO passwordDTO) =>
      _changePasswordRepo.change(passwordDTO);

  bool get hasErrors =>
      hasErrorPassword || hasErrorNewPassword || hasErrorConfPassword;

  bool get hasErrorPassword => validatePassword() != null;

  bool get hasErrorNewPassword => validateNewPassword() != null;

  bool get hasErrorConfPassword => validateConfPassword() != null;

  String? validatePassword() {
    const String _labelPswRequired = 'Senha atual é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 6 caracteres!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 6) {
      return _labelPswLenght;
    }
    return null;
  }

  String? validateNewPassword() {
    const String _labelPswRequired = 'Nova senha é obrigatória!!!';
    const String _labelPswLenght = 'Nova senha deve ter no mínimo 6 caracteres!!!';
    const String _labelPswNotValid = 'Informe uma nova senha válida!!!';

    if (formController.newPassword.isEmpty) {
      return _labelPswRequired;
    } else if (formController.newPassword.toString().length < 6) {
      return _labelPswLenght;
    } else if (!RegExp(
        r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{6,}$")
        .hasMatch(formController.newPassword)) {
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
    } else if (formController.confPassword != formController.newPassword) {
      return _labelPswNotValid;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? password,
    String? newPassword,
    String? confPassword,
  }) {
    super.password = password;
    super.newPassword = newPassword;
    super.confPassword = confPassword;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? password;

  @observable
  String? newPassword;

  @observable
  String? confPassword;

  @action
  changePassword(String value) => password = value;

  @action
  changeNewPassword(String value) => newPassword = value;

  @action
  changeConfPassword(String value) => confPassword = value;
}
