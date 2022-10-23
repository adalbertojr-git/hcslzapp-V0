import 'dart:async';
import 'package:flutter/material.dart';
import '../models/access.request.dart';
import '../repositories/access.request.repo.dart';
import 'package:mobx/mobx.dart';

import 'item.model.dart';

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
  bool isHidedButton = true;

  @observable
  ObservableFuture<List<AccessRequest>>? accessRequestListFuture;

  @observable
  ObservableFuture<AccessRequest>? accessRequestPost;

  @observable
  ObservableFuture<AccessRequest>? checkFuture;

  @observable
  ObservableList accessRequests = [].asObservable();

  @observable
  var listItems = ObservableList<ItemModel>();

  @observable
  var ids = ObservableList<int>();

  @observable
  late String errorMsg = '';

  @observable
  Future<List<AccessRequest>> future = Future<List<AccessRequest>>.value([]);

  @observable
  AccessRequestRepo _accessRequestRepo = AccessRequestRepo();

  init() {
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
  Future<List<AccessRequest>> findAll() => accessRequestListFuture =
          ObservableFuture(_accessRequestRepo.findAll().then((value) => value))
              .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future save() => accessRequestPost = ObservableFuture(
              _accessRequestRepo.save(_setValues()).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future check() => ObservableFuture(_accessRequestRepo
          .check(List<AccessRequest>.from(accessRequests))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future deleteById(int id) =>
      ObservableFuture(_accessRequestRepo.deleteById(id).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

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

  loadRequests(List<AccessRequest> list) {
    for (AccessRequest accessRequest in list) {
      listItems.add(
        ItemModel(
            id: accessRequest.id,
            name: accessRequest.name,
            email: accessRequest.email,
            check: false),
      );
    }
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

  String? validateName() {
    const String _labelNameRequired = 'Nome é obrigatório!!!';
    const String _labelNameLenght = 'Nome deve ter no mínimo 4 caracteres!!!';

    if (formController.name.isEmpty) {
      return _labelNameRequired;
    } else if (formController.name.toString().length < 4) {
      return _labelNameLenght;
    }
    return null;
  }

  String? validateUser() {
    const String _labelUserRequired = 'Usuário é obrigatório!!!';
    const String _labelUserLenght =
        'Usuário deve ter no mínimo 4 caracteres!!!';

    if (formController.user.isEmpty) {
      return _labelUserRequired;
    } else if (formController.user.toString().length < 4) {
      return _labelUserLenght;
    }
    return null;
  }

  String? validateEmail() {
    const String _labelEmailRequired = 'Email é obrigatório!!!';
    const String _labelEmailNotValid = 'Informe um email válido!!!';

    if (formController.email.isEmpty) {
      return _labelEmailRequired;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return _labelEmailNotValid;
    }
    return null;
  }

  String? validateConfEmail() {
    const String _labelConfEmailRequired =
        'Confirmação do email é obrigatória!!!';
    const String _labelEmailNotValid = 'Emails informados não conferem!!!';

    if (formController.confEmail.isEmpty) {
      return _labelConfEmailRequired;
    } else if (formController.confEmail != formController.email) {
      return _labelEmailNotValid;
    }
    return null;
  }

  String? validatePassword() {
    const String _labelPswRequired = 'Senha é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 4 caracteres!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 4) {
      return _labelPswLenght;
    }
    return null;
  }

  String? validateConfPassword() {
    const String _labelConfPswRequired =
        'Confirmação da senha é obrigatória!!!';
    const String _labelPswNotValid = 'Senhas informadas não conferem!!!';

    if (formController.confPassword.isEmpty) {
      return _labelConfPswRequired;
    } else if (formController.confPassword != formController.password) {
      return _labelPswNotValid;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? name,
    String? user,
    String? email,
    String? confEmail,
    String? confPassword,
    String? password,
  }) {
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
  String? name;

  @observable
  String? user;

  @observable
  String? email;

  @observable
  String? confEmail;

  @observable
  String? password;

  @observable
  String? confPassword;

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
