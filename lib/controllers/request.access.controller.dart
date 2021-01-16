import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/repositories/login.repo.dart';
import 'package:mobx/mobx.dart';

part 'request.access.controller.g.dart';

class RequestAccessController = RequestAccessControllerBase
    with _$RequestAccessController;

abstract class RequestAccessControllerBase with Store {
  var formController;

  @observable
  var nameReqAccessCtrl = TextEditingController();

  @observable
  var userReqAccessCtrl = TextEditingController();

  @observable
  var emailReqAccessCtrl = TextEditingController();

  @observable
  var confEmailReqAccessCtrl = TextEditingController();

  @observable
  var pswReqAccessCtrl = TextEditingController();

  @observable
  var confPswReqAccessCtrl = TextEditingController();

/*  @observable
  var emailForgotPswCtrl = TextEditingController();*/

  String errorMsg;

  final LoginRepo _loginRepo = LoginRepo();

  get init {
    formController = FormController(
        name: '',
        user: '',
        email: '',
        confEmail: '',
        confPassword: '',
        password: '');
  }

  String validateName() {
    print('---------- validateName ----------');
    if (formController.name.isEmpty) {
      return "Nome não pode ser nulo!!!";
    }
    return null;
  }

  String validateUser() {
    print('---------- validateUser ----------');
    if (formController.user.isEmpty) {
      return "Usuário não pode ser nulo!!!";
    }
    return null;
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

  String validateConfEmail() {
    print('---------- validateConfEmail ----------');
    if (formController.confEmail.isEmpty) {
      return "Confirmação do email não pode ser nulo!!!";
    }
    return null;
  }

  String validatePassword() {
    print('---------- validatePassword ----------');
    if (formController.password.isEmpty) {
      return "Senha não pode ser nula!!!";
    } if (formController.password.toString().length < 4) {
      return "Senha deve ter no mínimo 4 caracteres!!!";
    }
    return null;
  }

  String validateConfPassword() {
    print('---------- validateConfPassword ----------');
    if (formController.confPassword.isEmpty) {
      return "Confirmação da senha não pode ser nula!!!";
    } if (formController.confPassword != formController.password) {
      return "Senhas não conferem!!!";
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController(
      {String name,
      String user,
      String email,
      String confEmail,
      String confPassword,
      String password}) {
    super.name = name;
    super.user = user;
    super.email = email;
    super.confEmail = confEmail;
    super.password = password;
    super.confPassword = confPassword;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String name;

  @observable
  String user;

  @observable
  String email;

  @observable
  String confEmail;

  @observable
  String password;

  @observable
  String confPassword;

  @action
  changeName(String value) => name = value;

  @action
  changeUser(String value) => user = value;

  @action
  changeEmail(String value) => email = value;

  @action
  changeConfEmail(String value) => confEmail = value;

  @action
  changePassword(String value) => password = value;

  @action
  changeConfPassword(String value) => confPassword = value;
}
