import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:hcslzapp/repositories/login.repo.dart';
import 'package:mobx/mobx.dart';

part 'access.request.controller.g.dart';

class AccessRequestController = AccessRequestControllerBase
    with _$AccessRequestController;

abstract class AccessRequestControllerBase with Store {
  var formController;

  @observable
  var nameCtrl = TextEditingController();

  @observable
  var userCtrl = TextEditingController();

  @observable
  var emailCtrl = TextEditingController();

  @observable
  var confEmailCtrl = TextEditingController();

  @observable
  var pswCtrl = TextEditingController();

  @observable
  var confPswCtrl = TextEditingController();

  @observable
  ObservableFuture<AccessRequest> accessRequestPost;

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

  @action
  Future save() => accessRequestPost = ObservableFuture(
              _loginRepo.accessRequest(_setValues()).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  AccessRequest _setValues() {
    return AccessRequest(
      id: int.parse('0'),
      name: nameCtrl.text,
      user: userCtrl.text,
      email: emailCtrl.text,
      password: pswCtrl.text,
    );
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
    if (formController.confEmail != formController.email) {
      return "Emails não conferem!!!";
    }
    return null;
  }

  String validatePassword() {
    print('---------- validatePassword ----------');
    if (formController.password.isEmpty) {
      return "Senha não pode ser nula!!!";
    }
    if (formController.password.toString().length < 4) {
      return "Senha deve ter no mínimo 4 caracteres!!!";
    }
    return null;
  }

  String validateConfPassword() {
    print('---------- validateConfPassword ----------');
    if (formController.confPassword.isEmpty) {
      return "Confirmação da senha não pode ser nula!!!";
    }
    if (formController.confPassword != formController.password) {
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
