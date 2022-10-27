// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change.password.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangePasswordController on ChangePasswordControllerBase, Store {
  final _$currentPswCtrlAtom =
      Atom(name: 'ChangePasswordControllerBase.currentPswCtrl');

  @override
  TextEditingController get currentPswCtrl {
    _$currentPswCtrlAtom.reportRead();
    return super.currentPswCtrl;
  }

  @override
  set currentPswCtrl(TextEditingController value) {
    _$currentPswCtrlAtom.reportWrite(value, super.currentPswCtrl, () {
      super.currentPswCtrl = value;
    });
  }

  final _$pswCtrlAtom = Atom(name: 'ChangePasswordControllerBase.pswCtrl');

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
      Atom(name: 'ChangePasswordControllerBase.confPswCtrl');

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

  final _$isHidedButtonAtom =
      Atom(name: 'ChangePasswordControllerBase.isHidedButton');

  @override
  bool get isHidedButton {
    _$isHidedButtonAtom.reportRead();
    return super.isHidedButton;
  }

  @override
  set isHidedButton(bool value) {
    _$isHidedButtonAtom.reportWrite(value, super.isHidedButton, () {
      super.isHidedButton = value;
    });
  }

  final _$accessRequestListFutureAtom =
      Atom(name: 'ChangePasswordControllerBase.accessRequestListFuture');

  @override
  ObservableFuture<List<AccessRequest>>? get accessRequestListFuture {
    _$accessRequestListFutureAtom.reportRead();
    return super.accessRequestListFuture;
  }

  @override
  set accessRequestListFuture(ObservableFuture<List<AccessRequest>>? value) {
    _$accessRequestListFutureAtom
        .reportWrite(value, super.accessRequestListFuture, () {
      super.accessRequestListFuture = value;
    });
  }

  final _$accessRequestPostAtom =
      Atom(name: 'ChangePasswordControllerBase.accessRequestPost');

  @override
  ObservableFuture<AccessRequest>? get accessRequestPost {
    _$accessRequestPostAtom.reportRead();
    return super.accessRequestPost;
  }

  @override
  set accessRequestPost(ObservableFuture<AccessRequest>? value) {
    _$accessRequestPostAtom.reportWrite(value, super.accessRequestPost, () {
      super.accessRequestPost = value;
    });
  }

  final _$checkFutureAtom =
      Atom(name: 'ChangePasswordControllerBase.checkFuture');

  @override
  ObservableFuture<AccessRequest>? get checkFuture {
    _$checkFutureAtom.reportRead();
    return super.checkFuture;
  }

  @override
  set checkFuture(ObservableFuture<AccessRequest>? value) {
    _$checkFutureAtom.reportWrite(value, super.checkFuture, () {
      super.checkFuture = value;
    });
  }

  final _$accessRequestsAtom =
      Atom(name: 'ChangePasswordControllerBase.accessRequests');

  @override
  ObservableList<AccessRequest> get accessRequests {
    _$accessRequestsAtom.reportRead();
    return super.accessRequests;
  }

  @override
  set accessRequests(ObservableList<AccessRequest> value) {
    _$accessRequestsAtom.reportWrite(value, super.accessRequests, () {
      super.accessRequests = value;
    });
  }

  final _$listItemsAtom = Atom(name: 'ChangePasswordControllerBase.listItems');

  @override
  ObservableList<ItemModel> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<ItemModel> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$idsAtom = Atom(name: 'ChangePasswordControllerBase.ids');

  @override
  ObservableList<int> get ids {
    _$idsAtom.reportRead();
    return super.ids;
  }

  @override
  set ids(ObservableList<int> value) {
    _$idsAtom.reportWrite(value, super.ids, () {
      super.ids = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'ChangePasswordControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'ChangePasswordControllerBase.future');

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
      Atom(name: 'ChangePasswordControllerBase._accessRequestRepo');

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

  final _$ChangePasswordControllerBaseActionController =
      ActionController(name: 'ChangePasswordControllerBase');

  @override
  Future<dynamic> save() {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.save');
    try {
      return super.save();
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPswCtrl: ${currentPswCtrl},
pswCtrl: ${pswCtrl},
confPswCtrl: ${confPswCtrl},
isHidedButton: ${isHidedButton},
accessRequestListFuture: ${accessRequestListFuture},
accessRequestPost: ${accessRequestPost},
checkFuture: ${checkFuture},
accessRequests: ${accessRequests},
listItems: ${listItems},
ids: ${ids},
errorMsg: ${errorMsg},
future: ${future}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  final _$currentPasswordAtom =
      Atom(name: 'FormControllerBase.currentPassword');

  @override
  String? get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String? value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  final _$passwordAtom = Atom(name: 'FormControllerBase.password');

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

  final _$confPasswordAtom = Atom(name: 'FormControllerBase.confPassword');

  @override
  String? get confPassword {
    _$confPasswordAtom.reportRead();
    return super.confPassword;
  }

  @override
  set confPassword(String? value) {
    _$confPasswordAtom.reportWrite(value, super.confPassword, () {
      super.confPassword = value;
    });
  }

  final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase');

  @override
  dynamic changeCurrentPassword(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeCurrentPassword');
    try {
      return super.changeCurrentPassword(value);
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
currentPassword: ${currentPassword},
password: ${password},
confPassword: ${confPassword}
    ''';
  }
}
