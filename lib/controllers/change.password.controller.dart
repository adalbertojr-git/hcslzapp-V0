import 'dart:async';
import 'package:flutter/material.dart';
import '../models/access.request.dart';
import '../repositories/access.request.repo.dart';
import 'package:mobx/mobx.dart';

import 'item.model.dart';

part 'change.password.controller.g.dart';

class ChangePasswordController = ChangePasswordControllerBase
    with _$ChangePasswordController;

abstract class ChangePasswordControllerBase with Store {
  var formController;

  @observable
  var currentPswCtrl = TextEditingController();

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
  ObservableList<AccessRequest> accessRequests = ObservableList();

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
        currentPassword: '',
        confPassword: '',
        password: '');
  }

  @action
  Future save() => accessRequestPost = ObservableFuture(
              _accessRequestRepo.save(_setValues()).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  AccessRequest _setValues() {
    return AccessRequest(
      id: int.parse('0'),
      name: currentPswCtrl.text,
      user: '',
      email: '',
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
          check: false,
          authenticate: null,
          status: '',
          phone: '',
        ),
      );
    }
  }

  bool get hasErrors =>
      hasErrorCurrentPassword || hasErrorNewPassword || hasErrorConfNewPassword;

  bool get hasErrorCurrentPassword => validateCurrentPassword() != null;

  bool get hasErrorNewPassword => validateNewPassword() != null;

  bool get hasErrorConfNewPassword => validateConfNewPassword() != null;

  String? validateCurrentPassword() {
    const String _labelPswRequired = 'Senha atual é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 6 caracteres!!!';

    if (formController.currentPassword.isEmpty) {
      return _labelPswRequired;
    } else if (formController.currentPassword.toString().length < 6) {
      return _labelPswLenght;
    }
    return null;
  }

  String? validateNewPassword() {
    const String _labelPswRequired = 'Nova senha é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 6 caracteres!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 6) {
      return _labelPswLenght;
    }
    return null;
  }

  String? validateConfNewPassword() {
    const String _labelConfPswRequired =
        'Confirmação da nova senha é obrigatória!!!';
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
    String? currentPassword,
    String? confPassword,
    String? password,
  }) {
    super.currentPassword = currentPassword;
    super.password = password;
    super.confPassword = confPassword;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? currentPassword;

  @observable
  String? password;

  @observable
  String? confPassword;

  @action
  changeCurrentPassword(String value) => currentPassword = value;

  @action
  changePassword(String value) => password = value;

  @action
  changeConfPassword(String value) => confPassword = value;
}
