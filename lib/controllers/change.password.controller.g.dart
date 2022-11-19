// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change.password.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordController on ChangePasswordControllerBase, Store {
  late final _$pswCtrlAtom =
      Atom(name: 'ChangePasswordControllerBase.pswCtrl', context: context);

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

  late final _$confPswCtrlAtom =
      Atom(name: 'ChangePasswordControllerBase.confPswCtrl', context: context);

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

  late final _$errorMsgAtom =
      Atom(name: 'ChangePasswordControllerBase.errorMsg', context: context);

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

  late final _$_changePasswordRepoAtom = Atom(
      name: 'ChangePasswordControllerBase._changePasswordRepo',
      context: context);

  @override
  ChangePasswordRepo get _changePasswordRepo {
    _$_changePasswordRepoAtom.reportRead();
    return super._changePasswordRepo;
  }

  @override
  set _changePasswordRepo(ChangePasswordRepo value) {
    _$_changePasswordRepoAtom.reportWrite(value, super._changePasswordRepo, () {
      super._changePasswordRepo = value;
    });
  }

  late final _$ChangePasswordControllerBaseActionController =
      ActionController(name: 'ChangePasswordControllerBase', context: context);

  @override
  Future<dynamic> update(PasswordDTO passwordDTO) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.update');
    try {
      return super.update(passwordDTO);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pswCtrl: ${pswCtrl},
confPswCtrl: ${confPswCtrl},
errorMsg: ${errorMsg}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
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

  late final _$confPasswordAtom =
      Atom(name: 'FormControllerBase.confPassword', context: context);

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

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

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
password: ${password},
confPassword: ${confPassword}
    ''';
  }
}
