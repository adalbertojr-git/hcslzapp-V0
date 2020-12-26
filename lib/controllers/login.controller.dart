import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'formerror.controller.dart';

part 'login.controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {

  var formError = FormErrorController();

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

  String validateName() {
    if(formError.name == null || formError.name.isEmpty) {
      return "Nome não pode ser nulo!!!";
    }
    return null;
  }

}
