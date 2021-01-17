// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.request.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccessRequestController on AccessRequestControllerBase, Store {
  final _$nameReqAccessCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.nameReqAccessCtrl');

  @override
  TextEditingController get nameAccessReqCtrl {
    _$nameReqAccessCtrlAtom.reportRead();
    return super.nameAccessReqCtrl;
  }

  @override
  set nameAccessReqCtrl(TextEditingController value) {
    _$nameReqAccessCtrlAtom.reportWrite(value, super.nameAccessReqCtrl, () {
      super.nameAccessReqCtrl = value;
    });
  }

  final _$userReqAccessCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.userReqAccessCtrl');

  @override
  TextEditingController get userAccessReqCtrl {
    _$userReqAccessCtrlAtom.reportRead();
    return super.userAccessReqCtrl;
  }

  @override
  set userAccessReqCtrl(TextEditingController value) {
    _$userReqAccessCtrlAtom.reportWrite(value, super.userAccessReqCtrl, () {
      super.userAccessReqCtrl = value;
    });
  }

  final _$emailReqAccessCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.emailReqAccessCtrl');

  @override
  TextEditingController get emailAccessReqCtrl {
    _$emailReqAccessCtrlAtom.reportRead();
    return super.emailAccessReqCtrl;
  }

  @override
  set emailAccessReqCtrl(TextEditingController value) {
    _$emailReqAccessCtrlAtom.reportWrite(value, super.emailAccessReqCtrl, () {
      super.emailAccessReqCtrl = value;
    });
  }

  final _$confEmailReqAccessCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.confEmailReqAccessCtrl');

  @override
  TextEditingController get confEmailAccessReqCtrl {
    _$confEmailReqAccessCtrlAtom.reportRead();
    return super.confEmailAccessReqCtrl;
  }

  @override
  set confEmailAccessReqCtrl(TextEditingController value) {
    _$confEmailReqAccessCtrlAtom
        .reportWrite(value, super.confEmailAccessReqCtrl, () {
      super.confEmailAccessReqCtrl = value;
    });
  }

  final _$pswReqAccessCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.pswReqAccessCtrl');

  @override
  TextEditingController get pswAccessReqCtrl {
    _$pswReqAccessCtrlAtom.reportRead();
    return super.pswAccessReqCtrl;
  }

  @override
  set pswAccessReqCtrl(TextEditingController value) {
    _$pswReqAccessCtrlAtom.reportWrite(value, super.pswAccessReqCtrl, () {
      super.pswAccessReqCtrl = value;
    });
  }

  final _$confPswReqAccessCtrlAtom =
      Atom(name: 'AccessRequestControllerBase.confPswReqAccessCtrl');

  @override
  TextEditingController get confPswAccessReqCtrl {
    _$confPswReqAccessCtrlAtom.reportRead();
    return super.confPswAccessReqCtrl;
  }

  @override
  set confPswAccessReqCtrl(TextEditingController value) {
    _$confPswReqAccessCtrlAtom.reportWrite(value, super.confPswAccessReqCtrl,
        () {
      super.confPswAccessReqCtrl = value;
    });
  }

  @override
  String toString() {
    return '''
nameReqAccessCtrl: ${nameAccessReqCtrl},
userReqAccessCtrl: ${userAccessReqCtrl},
emailReqAccessCtrl: ${emailAccessReqCtrl},
confEmailReqAccessCtrl: ${confEmailAccessReqCtrl},
pswReqAccessCtrl: ${pswAccessReqCtrl},
confPswReqAccessCtrl: ${confPswAccessReqCtrl}
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
