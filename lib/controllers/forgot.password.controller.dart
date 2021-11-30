import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'forgot.password.controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  var formController;

  @observable
  var emailForgotPswCtrl = TextEditingController();

  @observable
  String errorMsg;

  init() {
    formController = FormController(email: '');
  }

  String validateEmail() {
    const String _labelEmailRequired = 'Email é obrigatório!!!';
    const String _labelEmailNotValid = 'Informe um email válido!!!';

    if (formController.email.isEmpty) {
      return _labelEmailRequired;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return _labelEmailNotValid;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String email}) {
    super.email = email;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String email;

  @action
  changeEmail(String value) => email = value;
}
