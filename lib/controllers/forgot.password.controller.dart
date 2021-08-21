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
    if (formController.email.isEmpty) {
      return "Email não pode ser nulo!!!";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return "Informe um email válido!!!";
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
