import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/http/http.exception.dart';
import '../models/associated.dart';
import '../models/token.dart';
import '../repositories/associated.repo.dart';
import '../repositories/login.repo.dart';
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
  ObservableFuture<Token>? token;

  @observable
  String errorMsg = "";

  @observable
  LoginRepo _loginRepo = LoginRepo();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  init() {
    formController = FormController(user: '', password: '');
  }

  Future<Token> authenticate() {
    try {
      return ObservableFuture(_loginRepo
          .authenticate(
            userLoginCtrl.text,
            pswLoginCtrl.text,
          )
          .then((value) => value));
    } on HttpException catch (e) {
      print(e);
      errorMsg = "$e";
    } on Exception catch (e) {
      print(e);
      errorMsg = "$e";
    } catch (e) {
      print(e);
      errorMsg = "$e";
    }
    return Future.error(errorMsg);
  }

  @action
  Future<List<Associated>> findByIdToList(int id) => ObservableFuture(
              _associatedRepo.findByIdToList(id).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  bool get hasErrors => hasErrorUser || hasErrorPassword;

  bool get hasErrorUser => validateUser() != null;

  bool get hasErrorPassword => validatePassword() != null;

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

  String? validatePassword() {
    const String _labelPswRequired = 'Senha é obrigatória!!!';
    const String _labelPswLenght = 'Senha deve ter no mínimo 6 caracteres!!!';

    if (formController.password.isEmpty) {
      return _labelPswRequired;
    } else if (formController.password.toString().length < 6) {
      return _labelPswLenght;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? user,
    String? password,
  }) {
    super.user = user;
    super.password = password;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? user;

  @observable
  String? password;

  @action
  changeUser(String value) => user = value;

  @action
  changePassword(String value) => password = value;
}
