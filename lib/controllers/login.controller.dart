import 'dart:async';
import 'package:flutter/material.dart';
import '../models/token.dart';
import '../repositories/login.repo.dart';
import 'package:mobx/mobx.dart';

part 'login.controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  var userCtrl = TextEditingController();

  @observable
  var pswCtrl = TextEditingController();

  @observable
  ObservableFuture<Token>? token;

  @observable
  LoginRepo _loginRepo = LoginRepo();

  @observable
  bool isPasswordVisible = false;

  Future<Token> authenticate(String user, String psw) =>
      _loginRepo.authenticate(
        user,
        psw,
      );

  bool get hasErrors => hasErrorUser || hasErrorPassword;

  bool get hasErrorUser => validateUser();

  bool get hasErrorPassword => validatePassword();

  bool validateUser() {
    if (userCtrl.text.isEmpty) return true;
    return false;
  }

  bool validatePassword() {
    if (pswCtrl.text.isEmpty) return true;
    return false;
  }

  @action
  bool setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

}
