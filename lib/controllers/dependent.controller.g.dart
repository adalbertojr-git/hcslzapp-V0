// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependent.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DependentController on DependentControllerBase, Store {
  late final _$idCtrlAtom =
      Atom(name: 'DependentControllerBase.idCtrl', context: context);

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

  late final _$nameCtrlAtom =
      Atom(name: 'DependentControllerBase.nameCtrl', context: context);

  @override
  TextEditingController? get nameCtrl {
    _$nameCtrlAtom.reportRead();
    return super.nameCtrl;
  }

  @override
  set nameCtrl(TextEditingController? value) {
    _$nameCtrlAtom.reportWrite(value, super.nameCtrl, () {
      super.nameCtrl = value;
    });
  }

  late final _$phoneCtrlAtom =
      Atom(name: 'DependentControllerBase.phoneCtrl', context: context);

  @override
  TextEditingController? get phoneCtrl {
    _$phoneCtrlAtom.reportRead();
    return super.phoneCtrl;
  }

  @override
  set phoneCtrl(TextEditingController? value) {
    _$phoneCtrlAtom.reportWrite(value, super.phoneCtrl, () {
      super.phoneCtrl = value;
    });
  }

  late final _$emailCtrlAtom =
      Atom(name: 'DependentControllerBase.emailCtrl', context: context);

  @override
  TextEditingController? get emailCtrl {
    _$emailCtrlAtom.reportRead();
    return super.emailCtrl;
  }

  @override
  set emailCtrl(TextEditingController? value) {
    _$emailCtrlAtom.reportWrite(value, super.emailCtrl, () {
      super.emailCtrl = value;
    });
  }

  late final _$cpfCtrlAtom =
      Atom(name: 'DependentControllerBase.cpfCtrl', context: context);

  @override
  TextEditingController? get cpfCtrl {
    _$cpfCtrlAtom.reportRead();
    return super.cpfCtrl;
  }

  @override
  set cpfCtrl(TextEditingController? value) {
    _$cpfCtrlAtom.reportWrite(value, super.cpfCtrl, () {
      super.cpfCtrl = value;
    });
  }

  late final _$bloodTypeCtrlAtom =
      Atom(name: 'DependentControllerBase.bloodTypeCtrl', context: context);

  @override
  TextEditingController? get bloodTypeCtrl {
    _$bloodTypeCtrlAtom.reportRead();
    return super.bloodTypeCtrl;
  }

  @override
  set bloodTypeCtrl(TextEditingController? value) {
    _$bloodTypeCtrlAtom.reportWrite(value, super.bloodTypeCtrl, () {
      super.bloodTypeCtrl = value;
    });
  }

  late final _$dateBirthCtrlAtom =
      Atom(name: 'DependentControllerBase.dateBirthCtrl', context: context);

  @override
  TextEditingController? get dateBirthCtrl {
    _$dateBirthCtrlAtom.reportRead();
    return super.dateBirthCtrl;
  }

  @override
  set dateBirthCtrl(TextEditingController? value) {
    _$dateBirthCtrlAtom.reportWrite(value, super.dateBirthCtrl, () {
      super.dateBirthCtrl = value;
    });
  }

  late final _$isAssociatedCtrlAtom =
      Atom(name: 'DependentControllerBase.isAssociatedCtrl', context: context);

  @override
  TextEditingController? get isAssociatedCtrl {
    _$isAssociatedCtrlAtom.reportRead();
    return super.isAssociatedCtrl;
  }

  @override
  set isAssociatedCtrl(TextEditingController? value) {
    _$isAssociatedCtrlAtom.reportWrite(value, super.isAssociatedCtrl, () {
      super.isAssociatedCtrl = value;
    });
  }

  late final _$isAssociatedAtom =
      Atom(name: 'DependentControllerBase.isAssociated', context: context);

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

  late final _$currentBloodTypeAtom =
      Atom(name: 'DependentControllerBase.currentBloodType', context: context);

  @override
  String get currentBloodType {
    _$currentBloodTypeAtom.reportRead();
    return super.currentBloodType;
  }

  @override
  set currentBloodType(String value) {
    _$currentBloodTypeAtom.reportWrite(value, super.currentBloodType, () {
      super.currentBloodType = value;
    });
  }

  late final _$dependentAtom =
      Atom(name: 'DependentControllerBase.dependent', context: context);

  @override
  Dependent get dependent {
    _$dependentAtom.reportRead();
    return super.dependent;
  }

  @override
  set dependent(Dependent value) {
    _$dependentAtom.reportWrite(value, super.dependent, () {
      super.dependent = value;
    });
  }

  late final _$DependentControllerBaseActionController =
      ActionController(name: 'DependentControllerBase', context: context);

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
isAssociated: ${isAssociated},
currentBloodType: ${currentBloodType},
dependent: ${dependent}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  late final _$nameAtom =
      Atom(name: 'FormControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'FormControllerBase.email', context: context);

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

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

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
