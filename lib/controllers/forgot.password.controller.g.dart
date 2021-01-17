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

  @override
  String toString() {
    return '''
emailForgotPswCtrl: ${emailForgotPswCtrl}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
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
