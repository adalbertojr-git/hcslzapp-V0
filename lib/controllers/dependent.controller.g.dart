// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependent.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DependentController on DependentControllerBase, Store {
  final _$idCtrlAtom = Atom(name: 'DependentControllerBase.idCtrl');

  @override
  TextEditingController get idCtrl {
    _$idCtrlAtom.reportRead();
    return super.idCtrl;
  }

  @override
  set idCtrl(TextEditingController value) {
    _$idCtrlAtom.reportWrite(value, super.idCtrl, () {
      super.idCtrl = value;
    });
  }

  final _$nameCtrlAtom = Atom(name: 'DependentControllerBase.nameCtrl');

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

  final _$phoneCtrlAtom = Atom(name: 'DependentControllerBase.phoneCtrl');

  @override
  TextEditingController get phoneCtrl {
    _$phoneCtrlAtom.reportRead();
    return super.phoneCtrl;
  }

  @override
  set phoneCtrl(TextEditingController value) {
    _$phoneCtrlAtom.reportWrite(value, super.phoneCtrl, () {
      super.phoneCtrl = value;
    });
  }

  final _$emailCtrlAtom = Atom(name: 'DependentControllerBase.emailCtrl');

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

  final _$cpfCtrlAtom = Atom(name: 'DependentControllerBase.cpfCtrl');

  @override
  TextEditingController get cpfCtrl {
    _$cpfCtrlAtom.reportRead();
    return super.cpfCtrl;
  }

  @override
  set cpfCtrl(TextEditingController value) {
    _$cpfCtrlAtom.reportWrite(value, super.cpfCtrl, () {
      super.cpfCtrl = value;
    });
  }

  final _$bloodTypeCtrlAtom =
      Atom(name: 'DependentControllerBase.bloodTypeCtrl');

  @override
  TextEditingController get bloodTypeCtrl {
    _$bloodTypeCtrlAtom.reportRead();
    return super.bloodTypeCtrl;
  }

  @override
  set bloodTypeCtrl(TextEditingController value) {
    _$bloodTypeCtrlAtom.reportWrite(value, super.bloodTypeCtrl, () {
      super.bloodTypeCtrl = value;
    });
  }

  final _$dateBirthCtrlAtom =
      Atom(name: 'DependentControllerBase.dateBirthCtrl');

  @override
  TextEditingController get dateBirthCtrl {
    _$dateBirthCtrlAtom.reportRead();
    return super.dateBirthCtrl;
  }

  @override
  set dateBirthCtrl(TextEditingController value) {
    _$dateBirthCtrlAtom.reportWrite(value, super.dateBirthCtrl, () {
      super.dateBirthCtrl = value;
    });
  }

  final _$isAssociatedCtrlAtom =
      Atom(name: 'DependentControllerBase.isAssociatedCtrl');

  @override
  TextEditingController get isAssociatedCtrl {
    _$isAssociatedCtrlAtom.reportRead();
    return super.isAssociatedCtrl;
  }

  @override
  set isAssociatedCtrl(TextEditingController value) {
    _$isAssociatedCtrlAtom.reportWrite(value, super.isAssociatedCtrl, () {
      super.isAssociatedCtrl = value;
    });
  }

  final _$isAssociatedAtom = Atom(name: 'DependentControllerBase.isAssociated');

  @override
  bool get isAssociated {
    _$isAssociatedAtom.reportRead();
    return super.isAssociated;
  }

  @override
  set isAssociated(bool value) {
    _$isAssociatedAtom.reportWrite(value, super.isAssociated, () {
      super.isAssociated = value;
    });
  }

  final _$DependentControllerBaseActionController =
      ActionController(name: 'DependentControllerBase');

  @override
  dynamic setAssociated() {
    final _$actionInfo = _$DependentControllerBaseActionController.startAction(
        name: 'DependentControllerBase.setAssociated');
    try {
      return super.setAssociated();
    } finally {
      _$DependentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
nameCtrl: ${nameCtrl},
phoneCtrl: ${phoneCtrl},
emailCtrl: ${emailCtrl},
cpfCtrl: ${cpfCtrl},
bloodTypeCtrl: ${bloodTypeCtrl},
dateBirthCtrl: ${dateBirthCtrl},
isAssociatedCtrl: ${isAssociatedCtrl},
isAssociated: ${isAssociated}
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
name: ${name},
email: ${email}
    ''';
  }
}
