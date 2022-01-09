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

  final _$bloodTypeCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.bloodTypeCtrl');

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

  final _$dueDateCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.dueDateCtrl');

  @override
  TextEditingController get dueDateCtrl {
    _$dueDateCtrlAtom.reportRead();
    return super.dueDateCtrl;
  }

  @override
  set dueDateCtrl(TextEditingController value) {
    _$dueDateCtrlAtom.reportWrite(value, super.dueDateCtrl, () {
      super.dueDateCtrl = value;
    });
  }

  final _$digitalIdentityAtom =
      Atom(name: 'DigitalIdentityControllerBase.digitalIdentity');

  @override
  DigitalIdentity get digitalIdentity {
    _$digitalIdentityAtom.reportRead();
    return super.digitalIdentity;
  }

  @override
  set digitalIdentity(DigitalIdentity value) {
    _$digitalIdentityAtom.reportWrite(value, super.digitalIdentity, () {
      super.digitalIdentity = value;
    });
  }

  final _$_digitalIdentityRepoAtom =
      Atom(name: 'DigitalIdentityControllerBase._digitalIdentityRepo');

  @override
  DigitalIdentityRepo get _digitalIdentityRepo {
    _$_digitalIdentityRepoAtom.reportRead();
    return super._digitalIdentityRepo;
  }

  @override
  set _digitalIdentityRepo(DigitalIdentityRepo value) {
    _$_digitalIdentityRepoAtom.reportWrite(value, super._digitalIdentityRepo,
        () {
      super._digitalIdentityRepo = value;
    });
  }

  final _$futureAtom = Atom(name: 'DigitalIdentityControllerBase.future');

  @override
  Future<dynamic> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<dynamic> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'DigitalIdentityControllerBase.errorMsg');

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

  final _$DigitalIdentityControllerBaseActionController =
      ActionController(name: 'DigitalIdentityControllerBase');

  @override
  Future<dynamic> findAssociatedByIdToList(int id) {
    final _$actionInfo =
        _$DigitalIdentityControllerBaseActionController.startAction(
            name: 'DigitalIdentityControllerBase.findAssociatedByIdToList');
    try {
      return super.findAssociatedByIdToList(id);
    } finally {
      _$DigitalIdentityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
associatedTypeCtrl: ${associatedTypeCtrl},
cnhCtrl: ${cnhCtrl},
cpfCtrl: ${cpfCtrl},
dateBirthCtrl: ${dateBirthCtrl},
dateShieldCtrl: ${dateShieldCtrl},
bloodTypeCtrl: ${bloodTypeCtrl},
dueDateCtrl: ${dueDateCtrl},
digitalIdentity: ${digitalIdentity},
future: ${future},
errorMsg: ${errorMsg}
    ''';
  }
}
