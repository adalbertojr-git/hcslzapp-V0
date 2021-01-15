import 'dart:async';
import 'dart:io';
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
  var nameReqAccessCtrl = TextEditingController();

  @observable
  var userReqAccessCtrl = TextEditingController();

  @observable
  var emailReqAccessCtrl = TextEditingController();

  @observable
  var pswReqAccessCtrl = TextEditingController();

  @observable
  var confPswReqAccessCtrl = TextEditingController();

  @observable
  var emailForgotPswCtrl = TextEditingController();

  @observable
  ObservableFuture<Token> token;

  String errorMsg;

  final LoginRepo _loginRepo = LoginRepo();

  get init {
    formController = FormController(name: '');
  }

/*  @action
  Future login() =>
      token = ObservableFuture(_loginRepo
          .login(userLoginCtrl.text, pswLoginCtrl.text)
          .then((value) => value)).catchError((e) {
            print("1");
        this.errorMsg = "HttpException: ${e.toString()}";
      }, test: (e) => e is HttpException).catchError((e) {
        print("2");
        this.errorMsg = "TimeOutException: ${e.toString()}";
      }, test: (e) => e is TimeoutException).catchError((e) {
        print("3");
        this.errorMsg = "${e.toString()}";
      }, test: (e) => e is Exception);*/

  @action
  Future login() =>
      token = ObservableFuture(_loginRepo
          .login(userLoginCtrl.text, pswLoginCtrl.text)
          .then((value) => value)).catchError((e) {
        this.errorMsg = "${e.message}";
      });

  String validateName() {
    print('---------- validateName ----------');
    print(formController.name);
    if(formController.name.isEmpty) {
      return "Nome não pode ser nulo!!!";
    }
    return null;
  }

}

class FormController extends FormControllerBase
    with _$FormController {

  FormController({String name}) {
    super.name = name;
  }

}

abstract class FormControllerBase with Store {
  @observable
  String name;

/*
  @observable
  String email;

  @observable
  String password;*/

  @action
  changeName(String value) {
    print('---------- changeName ----------');
    name = value;
    print('name: $name');
  }

}
