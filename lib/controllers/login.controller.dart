import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login.controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  var userLoginCtrl = TextEditingController();

  @observable
  var pswLoginCtrl = TextEditingController();

  @observable
  var nameReqAccessCtrl = TextEditingController();

  @observable
  var emailReqAccessCtrl = TextEditingController();

  @observable
  var pswReqAccessCtrl = TextEditingController();

  @observable
  var confPswReqAccessCtrl = TextEditingController();

  @observable
  var emailForgotPswCtrl = TextEditingController();

}
