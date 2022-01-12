import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glutton/glutton.dart';
import '../models/token.dart';
import '../repositories/associated.repo.dart';
import '../repositories/login.repo.dart';
import 'package:mobx/mobx.dart';

part 'login.controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  var userLoginCtrl = TextEditingController();

  @observable
  var pswLoginCtrl = TextEditingController();

  @observable
  ObservableFuture<Token>? token;

  @observable
  bool isLoading = false;

  @observable
  late String errorMsg = "";

  @observable
  LoginRepo _loginRepo = LoginRepo();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

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
  Future findByIdToList(int id) => ObservableFuture(
      _associatedRepo.findByIdToList(id).then((value) => value))
      .catchError((e) {
    errorMsg = "${e.message}";
  }, test: (e) => e is Exception);

  @action
  bool setLoading(bool value) => isLoading = value;

  Future setTokenToDevice(String token) async {
    const String _labelToken = 'token';
    await Glutton.eat(_labelToken, token);
  }

  Future setUserToDevice(String user) async {
    const String _labelUser = 'user';
    await Glutton.eat(_labelUser, user);
  }
}
