// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartnershipAddController on PartnershipAddControllerBase, Store {
  final _$idCtrlAtom = Atom(name: 'PartnershipAddControllerBase.idCtrl');

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

  final _$partnerCtrlAtom =
      Atom(name: 'PartnershipAddControllerBase.partnerCtrl');

  @override
  TextEditingController get partnerCtrl {
    _$partnerCtrlAtom.reportRead();
    return super.partnerCtrl;
  }

  @override
  set partnerCtrl(TextEditingController value) {
    _$partnerCtrlAtom.reportWrite(value, super.partnerCtrl, () {
      super.partnerCtrl = value;
    });
  }

  final _$phone1CtrlAtom =
      Atom(name: 'PartnershipAddControllerBase.phone1Ctrl');

  @override
  TextEditingController get phone1Ctrl {
    _$phone1CtrlAtom.reportRead();
    return super.phone1Ctrl;
  }

  @override
  set phone1Ctrl(TextEditingController value) {
    _$phone1CtrlAtom.reportWrite(value, super.phone1Ctrl, () {
      super.phone1Ctrl = value;
    });
  }

  final _$phone2CtrlAtom =
      Atom(name: 'PartnershipAddControllerBase.phone2Ctrl');

  @override
  TextEditingController get phone2Ctrl {
    _$phone2CtrlAtom.reportRead();
    return super.phone2Ctrl;
  }

  @override
  set phone2Ctrl(TextEditingController value) {
    _$phone2CtrlAtom.reportWrite(value, super.phone2Ctrl, () {
      super.phone2Ctrl = value;
    });
  }

  final _$addressCtrlAtom =
      Atom(name: 'PartnershipAddControllerBase.addressCtrl');

  @override
  TextEditingController get addressCtrl {
    _$addressCtrlAtom.reportRead();
    return super.addressCtrl;
  }

  @override
  set addressCtrl(TextEditingController value) {
    _$addressCtrlAtom.reportWrite(value, super.addressCtrl, () {
      super.addressCtrl = value;
    });
  }

  final _$promotionCtrlAtom =
      Atom(name: 'PartnershipAddControllerBase.promotionCtrl');

  @override
  TextEditingController get promotionCtrl {
    _$promotionCtrlAtom.reportRead();
    return super.promotionCtrl;
  }

  @override
  set promotionCtrl(TextEditingController value) {
    _$promotionCtrlAtom.reportWrite(value, super.promotionCtrl, () {
      super.promotionCtrl = value;
    });
  }

  final _$statusCtrlAtom =
      Atom(name: 'PartnershipAddControllerBase.statusCtrl');

  @override
  TextEditingController get statusCtrl {
    _$statusCtrlAtom.reportRead();
    return super.statusCtrl;
  }

  @override
  set statusCtrl(TextEditingController value) {
    _$statusCtrlAtom.reportWrite(value, super.statusCtrl, () {
      super.statusCtrl = value;
    });
  }

  final _$photoUrlAtom = Atom(name: 'PartnershipAddControllerBase.photoUrl');

  @override
  String get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  final _$isActiveAtom = Atom(name: 'PartnershipAddControllerBase.isActive');

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  final _$currentStatusAtom =
      Atom(name: 'PartnershipAddControllerBase.currentStatus');

  @override
  String get currentStatus {
    _$currentStatusAtom.reportRead();
    return super.currentStatus;
  }

  @override
  set currentStatus(String value) {
    _$currentStatusAtom.reportWrite(value, super.currentStatus, () {
      super.currentStatus = value;
    });
  }

  final _$partnershipAtom =
      Atom(name: 'PartnershipAddControllerBase.partnership');

  @override
  Partnership get partnership {
    _$partnershipAtom.reportRead();
    return super.partnership;
  }

  @override
  set partnership(Partnership value) {
    _$partnershipAtom.reportWrite(value, super.partnership, () {
      super.partnership = value;
    });
  }

  final _$PartnershipAddControllerBaseActionController =
      ActionController(name: 'PartnershipAddControllerBase');

  @override
  dynamic setStatus() {
    final _$actionInfo = _$PartnershipAddControllerBaseActionController
        .startAction(name: 'PartnershipAddControllerBase.setStatus');
    try {
      return super.setStatus();
    } finally {
      _$PartnershipAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
partnerCtrl: ${partnerCtrl},
phone1Ctrl: ${phone1Ctrl},
phone2Ctrl: ${phone2Ctrl},
addressCtrl: ${addressCtrl},
promotionCtrl: ${promotionCtrl},
statusCtrl: ${statusCtrl},
photoUrl: ${photoUrl},
isActive: ${isActive},
currentStatus: ${currentStatus},
partnership: ${partnership}
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
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
