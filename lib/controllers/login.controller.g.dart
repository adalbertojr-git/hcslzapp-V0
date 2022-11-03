// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on LoginControllerBase, Store {
  final _$userLoginCtrlAtom = Atom(name: 'LoginControllerBase.userLoginCtrl');

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

  final _$pswLoginCtrlAtom = Atom(name: 'LoginControllerBase.pswLoginCtrl');

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

  final _$tokenAtom = Atom(name: 'LoginControllerBase.token');

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

  final _$errorMsgAtom = Atom(name: 'LoginControllerBase.errorMsg');

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

  final _$_loginRepoAtom = Atom(name: 'LoginControllerBase._loginRepo');

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

  final _$_associatedRepoAtom =
      Atom(name: 'LoginControllerBase._associatedRepo');

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

  final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase');

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
