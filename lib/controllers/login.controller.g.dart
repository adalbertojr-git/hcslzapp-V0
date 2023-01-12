// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$userCtrlAtom =
      Atom(name: 'LoginControllerBase.userCtrl', context: context);

  @override
  TextEditingController get userCtrl {
    _$userCtrlAtom.reportRead();
    return super.userCtrl;
  }

  @override
  set userCtrl(TextEditingController value) {
    _$userCtrlAtom.reportWrite(value, super.userCtrl, () {
      super.userCtrl = value;
    });
  }

  late final _$pswCtrlAtom =
      Atom(name: 'LoginControllerBase.pswCtrl', context: context);

  @override
  TextEditingController get pswCtrl {
    _$pswCtrlAtom.reportRead();
    return super.pswCtrl;
  }

  @override
  set pswCtrl(TextEditingController value) {
    _$pswCtrlAtom.reportWrite(value, super.pswCtrl, () {
      super.pswCtrl = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: 'LoginControllerBase.token', context: context);

  @override
  ObservableFuture<Token>? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(ObservableFuture<Token>? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$_loginRepoAtom =
      Atom(name: 'LoginControllerBase._loginRepo', context: context);

  @override
  LoginRepo get _loginRepo {
    _$_loginRepoAtom.reportRead();
    return super._loginRepo;
  }

  @override
  set _loginRepo(LoginRepo value) {
    _$_loginRepoAtom.reportWrite(value, super._loginRepo, () {
      super._loginRepo = value;
    });
  }

  late final _$isPasswordVisibleAtom =
      Atom(name: 'LoginControllerBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  bool setPasswordVisibility() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.setPasswordVisibility');
    try {
      return super.setPasswordVisibility();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userCtrl: ${userCtrl},
pswCtrl: ${pswCtrl},
token: ${token},
isPasswordVisible: ${isPasswordVisible}
    ''';
  }
}
