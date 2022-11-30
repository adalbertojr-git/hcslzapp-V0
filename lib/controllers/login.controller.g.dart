// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$userLoginCtrlAtom =
      Atom(name: 'LoginControllerBase.userLoginCtrl', context: context);

  @override
  TextEditingController get userLoginCtrl {
    _$userLoginCtrlAtom.reportRead();
    return super.userLoginCtrl;
  }

  @override
  set userLoginCtrl(TextEditingController value) {
    _$userLoginCtrlAtom.reportWrite(value, super.userLoginCtrl, () {
      super.userLoginCtrl = value;
    });
  }

  late final _$pswLoginCtrlAtom =
      Atom(name: 'LoginControllerBase.pswLoginCtrl', context: context);

  @override
  TextEditingController get pswLoginCtrl {
    _$pswLoginCtrlAtom.reportRead();
    return super.pswLoginCtrl;
  }

  @override
  set pswLoginCtrl(TextEditingController value) {
    _$pswLoginCtrlAtom.reportWrite(value, super.pswLoginCtrl, () {
      super.pswLoginCtrl = value;
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

  late final _$errorMsgAtom =
      Atom(name: 'LoginControllerBase.errorMsg', context: context);

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
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

  late final _$_associatedRepoAtom =
      Atom(name: 'LoginControllerBase._associatedRepo', context: context);

  @override
  AssociatedRepo get _associatedRepo {
    _$_associatedRepoAtom.reportRead();
    return super._associatedRepo;
  }

  @override
  set _associatedRepo(AssociatedRepo value) {
    _$_associatedRepoAtom.reportWrite(value, super._associatedRepo, () {
      super._associatedRepo = value;
    });
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  Future<Token> authenticate() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.authenticate');
    try {
      return super.authenticate();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Associated>> findByIdToList(int id) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.findByIdToList');
    try {
      return super.findByIdToList(id);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userLoginCtrl: ${userLoginCtrl},
pswLoginCtrl: ${pswLoginCtrl},
token: ${token},
errorMsg: ${errorMsg}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  late final _$userAtom =
      Atom(name: 'FormControllerBase.user', context: context);

  @override
  String? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'FormControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  dynamic changeUser(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeUser');
    try {
      return super.changeUser(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password}
    ''';
  }
}
