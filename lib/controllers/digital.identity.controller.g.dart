// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital.identity.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DigitalIdentityController on DigitalIdentityControllerBase, Store {
  final _$nameCtrlAtom = Atom(name: 'DigitalIdentityControllerBase.nameCtrl');

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

  final _$sponsorCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.sponsorCtrl');

  @override
  TextEditingController get sponsorCtrl {
    _$sponsorCtrlAtom.reportRead();
    return super.sponsorCtrl;
  }

  @override
  set sponsorCtrl(TextEditingController value) {
    _$sponsorCtrlAtom.reportWrite(value, super.sponsorCtrl, () {
      super.sponsorCtrl = value;
    });
  }

  final _$associatedTypeCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.associatedTypeCtrl');

  @override
  TextEditingController get associatedTypeCtrl {
    _$associatedTypeCtrlAtom.reportRead();
    return super.associatedTypeCtrl;
  }

  @override
  set associatedTypeCtrl(TextEditingController value) {
    _$associatedTypeCtrlAtom.reportWrite(value, super.associatedTypeCtrl, () {
      super.associatedTypeCtrl = value;
    });
  }

  final _$cnhCtrlAtom = Atom(name: 'DigitalIdentityControllerBase.cnhCtrl');

  @override
  TextEditingController get cnhCtrl {
    _$cnhCtrlAtom.reportRead();
    return super.cnhCtrl;
  }

  @override
  set cnhCtrl(TextEditingController value) {
    _$cnhCtrlAtom.reportWrite(value, super.cnhCtrl, () {
      super.cnhCtrl = value;
    });
  }

  final _$cpfCtrlAtom = Atom(name: 'DigitalIdentityControllerBase.cpfCtrl');

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

  final _$dateBirthCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.dateBirthCtrl');

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

  final _$dateShieldCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.dateShieldCtrl');

  @override
  TextEditingController get dateShieldCtrl {
    _$dateShieldCtrlAtom.reportRead();
    return super.dateShieldCtrl;
  }

  @override
  set dateShieldCtrl(TextEditingController value) {
    _$dateShieldCtrlAtom.reportWrite(value, super.dateShieldCtrl, () {
      super.dateShieldCtrl = value;
    });
  }

  final _$photoPathAtom = Atom(name: 'DigitalIdentityControllerBase.photoPath');

  @override
  String get photoPath {
    _$photoPathAtom.reportRead();
    return super.photoPath;
  }

  @override
  set photoPath(String value) {
    _$photoPathAtom.reportWrite(value, super.photoPath, () {
      super.photoPath = value;
    });
  }

  final _$DigitalIdentityControllerBaseActionController =
      ActionController(name: 'DigitalIdentityControllerBase');

  @override
  dynamic setPhoto(String value) {
    final _$actionInfo = _$DigitalIdentityControllerBaseActionController
        .startAction(name: 'DigitalIdentityControllerBase.setPhoto');
    try {
      return super.setPhoto(value);
    } finally {
      _$DigitalIdentityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
sponsorCtrl: ${sponsorCtrl},
associatedTypeCtrl: ${associatedTypeCtrl},
cnhCtrl: ${cnhCtrl},
cpfCtrl: ${cpfCtrl},
dateBirthCtrl: ${dateBirthCtrl},
dateShieldCtrl: ${dateShieldCtrl},
photoPath: ${photoPath}
    ''';
  }
}
