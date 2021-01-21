import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:hcslzapp/repositories/access.request.repo.dart';
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
  bool isHideButton = true;

  @observable
  ObservableFuture<List<AccessRequest>> accessRequestListFuture;

  @observable
  ObservableFuture<AccessRequest> accessRequestPost;

  @observable
  ObservableList accessRequests = [].asObservable();

  String errorMsg;

  Future<List<AccessRequest>> future;

  final AccessRequestRepo _accessRequestRepo = AccessRequestRepo();

  get init {
    accessRequests.clear();
    formController = FormController(
        name: '',
        user: '',
        email: '',
        confEmail: '',
        confPassword: '',
        password: '');
  }

  @action
  Future findAll() => accessRequestListFuture =
          ObservableFuture(_accessRequestRepo.findAll().then((value) => value))
              .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future save() => accessRequestPost = ObservableFuture(
              _accessRequestRepo.save(_setValues()).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  bool hideButton() => isHideButton = !isHideButton;

  Future<List<AccessRequest>> getFuture() => future = findAll();

  AccessRequest _setValues() {
    return AccessRequest(
      id: int.parse('0'),
      name: nameCtrl.text,
      user: userCtrl.text,
      email: emailCtrl.text,
      password: pswCtrl.text,
    );
  }

  bool get hasErrors =>
      hasErrorName ||
      hasErrorUser ||
      hasErrorEmail ||
      hasErrorConfEmail ||
      hasErrorPassword ||
      hasErrorConfPassword;

  bool get hasErrorName => validateName() != null;

  bool get hasErrorUser => validateUser() != null;

  bool get hasErrorEmail => validateEmail() != null;

  bool get hasErrorConfEmail => validateConfEmail() != null;

  bool get hasErrorPassword => validatePassword() != null;

  bool get hasErrorConfPassword => validateConfPassword() != null;

  String validateName() {
    print('---------- validateName ----------');
    if (formController.name.isEmpty) {
      return "Nome é obrigatório!!!";
    }
    return null;
  }

  String validateUser() {
    print('---------- validateUser ----------');
    if (formController._user.isEmpty) {
      return "Usuário é obrigatório!!!";
    }
    return null;
  }

  String validateEmail() {
    if (formController.email.isEmpty) {
      return "Email é obrigatório!!!";
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
      return "Confirmação do email é obrigatória!!!";
    }
    if (formController.confEmail != formController.email) {
      return "Emails informados não conferem!!!";
    }
    return null;
  }

  String validatePassword() {
    print('---------- validatePassword ----------');
    if (formController.password.isEmpty) {
      return "Senha é obrigatória!!!";
    }
    if (formController.password.toString().length < 4) {
      return "Senha deve ter no mínimo 4 caracteres!!!";
    }
    return null;
  }

  String validateConfPassword() {
    print('---------- validateConfPassword ----------');
    if (formController.confPassword.isEmpty) {
      return "Confirmação da senha é obrigatória!!!";
    }
    if (formController.confPassword != formController.password) {
      return "Senhas informadas não conferem!!!";
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

class ListItemController = ListItemControllerBase with _$ListItemController;

abstract class ListItemControllerBase with Store {
  @observable
  bool check = false;

  @action
  setCheck(bool value) => check = value;
}
