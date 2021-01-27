// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.request.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccessRequestController on AccessRequestControllerBase, Store {
  final _$nameCtrlAtom = Atom(name: 'AccessRequestControllerBase.nameCtrl');

  @override
  TextEditingController get nameCtrl {
    _$nameCtrlAtom.reportRead();
    return super.nameCtrl;
  }

  @override
  set nameCtrl(TextEditingController value) {
    _$nameCtrlAtom.reportWrite(value, super.nameCtrl, () {
      super.nameCtrl = value;
    });
  }

  final _$userCtrlAtom = Atom(name: 'AccessRequestControllerBase.userCtrl');

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

  final _$emailCtrlAtom = Atom(name: 'AccessRequestControllerBase.emailCtrl');

  @override
  TextEditingController get emailCtrl {
    _$emailCtrlAtom.reportRead();
    return super.emailCtrl;
  }

  @override
  set emailCtrl(TextEditingController value) {
    _$emailCtrlAtom.reportWrite(value, super.emailCtrl, () {
      super.emailCtrl = value;
    });
  }

  final _$confEmailCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.confEmailCtrl');

  @override
  TextEditingController get confEmailCtrl {
    _$confEmailCtrlAtom.reportRead();
    return super.confEmailCtrl;
  }

  @override
  set confEmailCtrl(TextEditingController value) {
    _$confEmailCtrlAtom.reportWrite(value, super.confEmailCtrl, () {
      super.confEmailCtrl = value;
    });
  }

  final _$pswCtrlAtom = Atom(name: 'AccessRequestControllerBase.pswCtrl');

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

  final _$confPswCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.confPswCtrl');

  @override
  TextEditingController get confPswCtrl {
    _$confPswCtrlAtom.reportRead();
    return super.confPswCtrl;
  }

  @override
  set confPswCtrl(TextEditingController value) {
    _$confPswCtrlAtom.reportWrite(value, super.confPswCtrl, () {
      super.confPswCtrl = value;
    });
  }

  final _$isHideButtonAtom =
      Atom(name: 'AccessRequestControllerBase.isHideButton');

  @override
  bool get isHideButton {
    _$isHideButtonAtom.reportRead();
    return super.isHideButton;
  }

  @override
  set isHideButton(bool value) {
    _$isHideButtonAtom.reportWrite(value, super.isHideButton, () {
      super.isHideButton = value;
    });
  }

  final _$accessRequestListFutureAtom =
      Atom(name: 'AccessRequestControllerBase.accessRequestListFuture');

  @override
  ObservableFuture<List<AccessRequest>> get accessRequestListFuture {
    _$accessRequestListFutureAtom.reportRead();
    return super.accessRequestListFuture;
  }

  @override
  set accessRequestListFuture(ObservableFuture<List<AccessRequest>> value) {
    _$accessRequestListFutureAtom
        .reportWrite(value, super.accessRequestListFuture, () {
      super.accessRequestListFuture = value;
    });
  }

  final _$accessRequestPostAtom =
      Atom(name: 'AccessRequestControllerBase.accessRequestPost');

  @override
  ObservableFuture<AccessRequest> get accessRequestPost {
    _$accessRequestPostAtom.reportRead();
    return super.accessRequestPost;
  }

  @override
  set accessRequestPost(ObservableFuture<AccessRequest> value) {
    _$accessRequestPostAtom.reportWrite(value, super.accessRequestPost, () {
      super.accessRequestPost = value;
    });
  }

  final _$checkFutureAtom =
      Atom(name: 'AccessRequestControllerBase.checkFuture');

  @override
  ObservableFuture<AccessRequest> get checkFuture {
    _$checkFutureAtom.reportRead();
    return super.checkFuture;
  }

  @override
  set checkFuture(ObservableFuture<AccessRequest> value) {
    _$checkFutureAtom.reportWrite(value, super.checkFuture, () {
      super.checkFuture = value;
    });
  }

  final _$accessRequestsAtom =
      Atom(name: 'AccessRequestControllerBase.accessRequests');

  @override
  ObservableList<dynamic> get accessRequests {
    _$accessRequestsAtom.reportRead();
    return super.accessRequests;
  }

  @override
  set accessRequests(ObservableList<dynamic> value) {
    _$accessRequestsAtom.reportWrite(value, super.accessRequests, () {
      super.accessRequests = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'AccessRequestControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'AccessRequestControllerBase.future');

  @override
  Future<List<AccessRequest>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<AccessRequest>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$_accessRequestRepoAtom =
      Atom(name: 'AccessRequestControllerBase._accessRequestRepo');

  @override
  AccessRequestRepo get _accessRequestRepo {
    _$_accessRequestRepoAtom.reportRead();
    return super._accessRequestRepo;
  }

  @override
  set _accessRequestRepo(AccessRequestRepo value) {
    _$_accessRequestRepoAtom.reportWrite(value, super._accessRequestRepo, () {
      super._accessRequestRepo = value;
    });
  }

  final _$AccessRequestControllerBaseActionController =
      ActionController(name: 'AccessRequestControllerBase');

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$AccessRequestControllerBaseActionController
        .startAction(name: 'AccessRequestControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$AccessRequestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> save() {
    final _$actionInfo = _$AccessRequestControllerBaseActionController
        .startAction(name: 'AccessRequestControllerBase.save');
    try {
      return super.save();
    } finally {
      _$AccessRequestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> check() {
    final _$actionInfo = _$AccessRequestControllerBaseActionController
        .startAction(name: 'AccessRequestControllerBase.check');
    try {
      return super.check();
    } finally {
      _$AccessRequestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool hideButton() {
    final _$actionInfo = _$AccessRequestControllerBaseActionController
        .startAction(name: 'AccessRequestControllerBase.hideButton');
    try {
      return super.hideButton();
    } finally {
      _$AccessRequestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
userCtrl: ${userCtrl},
emailCtrl: ${emailCtrl},
confEmailCtrl: ${confEmailCtrl},
pswCtrl: ${pswCtrl},
confPswCtrl: ${confPswCtrl},
isHideButton: ${isHideButton},
accessRequestListFuture: ${accessRequestListFuture},
accessRequestPost: ${accessRequestPost},
checkFuture: ${checkFuture},
accessRequests: ${accessRequests},
errorMsg: ${errorMsg},
future: ${future}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  final _$nameAtom = Atom(name: 'FormControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$userAtom = Atom(name: 'FormControllerBase.user');

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$emailAtom = Atom(name: 'FormControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$confEmailAtom = Atom(name: 'FormControllerBase.confEmail');

  @override
  String get confEmail {
    _$confEmailAtom.reportRead();
    return super.confEmail;
  }

  @override
  set confEmail(String value) {
    _$confEmailAtom.reportWrite(value, super.confEmail, () {
      super.confEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: 'FormControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confPasswordAtom = Atom(name: 'FormControllerBase.confPassword');

  @override
  String get confPassword {
    _$confPasswordAtom.reportRead();
    return super.confPassword;
  }

  @override
  set confPassword(String value) {
    _$confPasswordAtom.reportWrite(value, super.confPassword, () {
      super.confPassword = value;
    });
  }

  final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic changeEmail(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeConfEmail(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeConfEmail');
    try {
      return super.changeConfEmail(value);
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
  dynamic changeConfPassword(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeConfPassword');
    try {
      return super.changeConfPassword(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
user: ${user},
email: ${email},
confEmail: ${confEmail},
password: ${password},
confPassword: ${confPassword}
    ''';
  }
}
