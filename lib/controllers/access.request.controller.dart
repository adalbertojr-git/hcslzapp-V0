import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  var pswCtrl = TextEditingController();

  @observable
  var confPswCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList<AccessRequest> accessRequests = ObservableList();

  @observable
  var listItems = ObservableList<ItemModel>();

  @observable
  var ids = ObservableList<int>();

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
        confPassword: '',
        password: '');
  }

  @action
  Future<List<AccessRequest>> findAll() => _accessRequestRepo.findAll();

  @action
  Future<AccessRequest> save() => _accessRequestRepo.save(
        _setValues(),
      );

  @action
  Future<Response> allow() => _accessRequestRepo.allow(
        List<AccessRequest>.from(accessRequests),
      );

  @action
  Future<Response> deleteById(AccessRequest accessRequest) =>
      _accessRequestRepo.deleteById(accessRequest);

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
          user: accessRequest.user,
          password: accessRequest.password,
          check: false,
          authenticate: null,
          status: '',
          phone: '',
        ),
      );
    }
  }

  bool get hasErrors =>
      hasErrorName ||
      hasErrorUser ||
      hasErrorEmail ||
      hasErrorPassword ||
      hasErrorConfPassword;

  bool get hasErrorName => validateName() != null;

  bool get hasErrorUser => validateUser() != null;

  bool get hasErrorEmail => validateEmail() != null;

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
    const String _labelUserOnlyLettersAndNumbers = 'Usuário deve possuir somente letras e números!!!';
    const String _labelUserNotOnlyNumbers = 'Usuário não deve conter somente números!!!';
    const String _labelUserNotRepeated = 'Usuário não deve conter 4 caracteres repetidos!!!';

    if (formController.user.isEmpty) {
      return _labelUserRequired;
    } else if (formController.user.toString().length < 4) {
      return _labelUserLenght;
    } else if (!RegExp(r"^[a-z0-9]+$")
        .hasMatch(formController.user)) {
      return _labelUserOnlyLettersAndNumbers;
    } else if (RegExp(r"^[0-9]+$")
        .hasMatch(formController.user)) {
      return _labelUserNotOnlyNumbers;
    } else if (RegExp(r"(.)\1{3,}")
        .hasMatch(formController.user)) {
      return _labelUserNotRepeated;
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

  String? validatePassword() {
    const String _labelPswRequired = 'Senha é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 6 caracteres!!!';
    const String _labelPswNotValid = 'Informe uma senha válida!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 6) {
      return _labelPswLenght;
    } else if (!RegExp(
        r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{6,}$")
        .hasMatch(formController.password)) {
      return _labelPswNotValid;
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
    String? confPassword,
    String? password,
  }) {
    super.name = name;
    super.user = user;
    super.email = email;
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
  changePassword(String value) => password = value;

  @action
  changeConfPassword(String value) => confPassword = value;
}
