import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glutton/glutton.dart';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/associated.dart';
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
  String errorMsg = "";

  @observable
  LoginRepo _loginRepo = LoginRepo();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @action
  Future<Token> authenticate() => token = ObservableFuture(_loginRepo
          .authenticate(
            userLoginCtrl.text,
            pswLoginCtrl.text,
          )
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future<List<Associated>> findByIdToList(int id) => ObservableFuture(
              _associatedRepo.findByIdToList(id).then((value) => value))
          .catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future setTokenToDevice(String token) async {
    const String _labelToken = 'token';
    await Glutton.eat(_labelToken, token);
  }

  Future setUserToDevice(String user) async {
    const String _labelUser = 'user';
    await Glutton.eat(_labelUser, user);
  }
}
