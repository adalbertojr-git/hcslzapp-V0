// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot.password.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on ForgotPasswordControllerBase, Store {
  final _$emailForgotPswCtrlAtom =
      Atom(name: 'ForgotPasswordControllerBase.emailForgotPswCtrl');

  @override
  TextEditingController get emailForgotPswCtrl {
    _$emailForgotPswCtrlAtom.reportRead();
    return super.emailForgotPswCtrl;
  }

  @override
  set emailForgotPswCtrl(TextEditingController value) {
    _$emailForgotPswCtrlAtom.reportWrite(value, super.emailForgotPswCtrl, () {
      super.emailForgotPswCtrl = value;
    });
  }

  final _$codeCtrlAtom = Atom(name: 'ForgotPasswordControllerBase.codeCtrl');

  @override
  TextEditingController get codeCtrl {
    _$codeCtrlAtom.reportRead();
    return super.codeCtrl;
  }

  @override
  set codeCtrl(TextEditingController value) {
    _$codeCtrlAtom.reportWrite(value, super.codeCtrl, () {
      super.codeCtrl = value;
    });
  }

  final _$_forgotPasswordRepoAtom =
      Atom(name: 'ForgotPasswordControllerBase._forgotPasswordRepo');

  @override
  ForgotPasswordRepo get _forgotPasswordRepo {
    _$_forgotPasswordRepoAtom.reportRead();
    return super._forgotPasswordRepo;
  }

  @override
  set _forgotPasswordRepo(ForgotPasswordRepo value) {
    _$_forgotPasswordRepoAtom.reportWrite(value, super._forgotPasswordRepo, () {
      super._forgotPasswordRepo = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'ForgotPasswordControllerBase.errorMsg');

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

  final _$ForgotPasswordControllerBaseActionController =
      ActionController(name: 'ForgotPasswordControllerBase');

  @override
  Future<Password> forgotPassword(String email) {
    final _$actionInfo = _$ForgotPasswordControllerBaseActionController
        .startAction(name: 'ForgotPasswordControllerBase.forgotPassword');
    try {
      return super.forgotPassword(email);
    } finally {
      _$ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<String> validateCode(Password password) {
    final _$actionInfo = _$ForgotPasswordControllerBaseActionController
        .startAction(name: 'ForgotPasswordControllerBase.validateCode');
    try {
      return super.validateCode(password);
    } finally {
      _$ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailForgotPswCtrl: ${emailForgotPswCtrl},
codeCtrl: ${codeCtrl},
errorMsg: ${errorMsg}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  final _$emailAtom = Atom(name: 'FormControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase');

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
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
