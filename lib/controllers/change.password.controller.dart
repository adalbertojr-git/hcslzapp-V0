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
  var confPswCtrl = TextEditingController();

  @observable
  late String errorMsg = '';

  @observable
  ChangePasswordRepo _changePasswordRepo = ChangePasswordRepo();

  init() {
    formController =
        FormController(confPassword: '', password: '');
  }

  @action
  Future<String> update(PasswordDTO passwordDTO) => ObservableFuture(
              _changePasswordRepo.update(passwordDTO).then((value) => value));

  bool get hasErrors => hasErrorNewPassword || hasErrorConfNewPassword;

  bool get hasErrorNewPassword => validateNewPassword() != null;

  bool get hasErrorConfNewPassword => validateConfNewPassword() != null;

  String? validateNewPassword() {
    const String _labelPswRequired = 'Nova senha é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 6 caracteres!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 6) {
      return _labelPswLenght;
    }
    return null;
  }

  String? validateConfNewPassword() {
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
