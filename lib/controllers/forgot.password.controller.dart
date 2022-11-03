import 'package:flutter/material.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:hcslzapp/repositories/forgot.password.repo.dart';
import 'package:mobx/mobx.dart';

part 'forgot.password.controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  var formController;

  @observable
  var emailForgotPswCtrl = TextEditingController();

  @observable
  var codeCtrl = TextEditingController();

  @observable
  ForgotPasswordRepo _forgotPasswordRepo = ForgotPasswordRepo();

  @observable
  String errorMsg = '';

/*  @observable
  Future<String> future = Future<String>.value([]);*/

  init() {
    formController = FormController(email: '');
  }

  initTextFields() {
    emailForgotPswCtrl.text = '';
    codeCtrl.text = '';
  }

  @action
  Future<PasswordDTO> forgotPassword(String email) =>
      ObservableFuture(_forgotPasswordRepo.sendEmail(email).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future<String> validateCode(PasswordDTO password) =>
      ObservableFuture(_forgotPasswordRepo.validateCode(password).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  bool get hasErrors => hasErrorEmail;

  bool get hasErrorEmail => validateEmail() != null;

  String? validateEmail() {
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
  FormController({String? email}) {
    super.email = email;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? email;

  @action
  changeEmail(String value) => email = value;
}
