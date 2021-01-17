import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:hcslzapp/repositories/login.repo.dart';
import 'package:mobx/mobx.dart';

part 'login.controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  var formController;

  @observable
  var userLoginCtrl = TextEditingController();

  @observable
  var pswLoginCtrl = TextEditingController();

  @observable
  ObservableFuture<Token> token;

  String errorMsg;

  final LoginRepo _loginRepo = LoginRepo();

  get init {
    formController = FormController(user: '', password: '');
  }

  @action
  Future login() => token = ObservableFuture(_loginRepo
          .authenticate(userLoginCtrl.text, pswLoginCtrl.text)
          .then((value) => value)).catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  String validateUser() {
    print('---------- validateUser ----------');
    if (formController.user.isEmpty) {
      return "Usuário não pode ser nulo!!!";
    }
    return null;
  }

  String validatePassword() {
    print('---------- validatePassword ----------');
    if (formController.password.isEmpty) {
      return "Senha não pode ser nula!!!";
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String user, String password}) {
    super.user = user;
    super.password = password;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String user;

  @observable
  String password;

  @action
  changeUser(String value) => user = value;

  @action
  changePassword(String value) => password = value;
}
