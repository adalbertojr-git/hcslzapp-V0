import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glutton/glutton.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:hcslzapp/repositories/login.repo.dart';
import 'package:mobx/mobx.dart';

part 'login.controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  var userLoginCtrl = TextEditingController();

  @observable
  var pswLoginCtrl = TextEditingController();

  @observable
  ObservableFuture<Token> token;

  @observable
  bool isLoading = false;

  @observable
  String errorMsg;

  @observable
  LoginRepo _loginRepo = LoginRepo();

  @action
  Future authenticate() => token = ObservableFuture(_loginRepo
          .authenticate(
            userLoginCtrl.text,
            pswLoginCtrl.text,
          )
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  bool setLoading(bool value) => isLoading = value;

  Future setTokenToDevice(String token) async {
    await Glutton.eat("token", token);
  }

  Future setUserToDevice(String user) async {
    await Glutton.eat("user", user);
  }
}
