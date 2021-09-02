// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentListController on PaymentListControllerBase, Store {
  Computed<List<Associated>> _$listFilteredComputed;

  @override
  List<Associated> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Associated>>(() => super.listFiltered,
              name: 'PaymentListControllerBase.listFiltered'))
      .value;

  final _$nameCtrlAtom = Atom(name: 'PaymentListControllerBase.nameCtrl');

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

  final _$isHidedButtonAtom =
      Atom(name: 'PaymentListControllerBase.isHidedButton');

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

  final _$associatedsAtom = Atom(name: 'PaymentListControllerBase.associateds');

  @override
  ObservableList<dynamic> get associateds {
    _$associatedsAtom.reportRead();
    return super.associateds;
  }

  @override
  set associateds(ObservableList<dynamic> value) {
    _$associatedsAtom.reportWrite(value, super.associateds, () {
      super.associateds = value;
    });
  }

  final _$_paymentTableRepoAtom =
      Atom(name: 'PaymentListControllerBase._paymentTableRepo');

  @override
  PaymentTableRepo get _paymentTableRepo {
    _$_paymentTableRepoAtom.reportRead();
    return super._paymentTableRepo;
  }

  @override
  set _paymentTableRepo(PaymentTableRepo value) {
    _$_paymentTableRepoAtom.reportWrite(value, super._paymentTableRepo, () {
      super._paymentTableRepo = value;
    });
  }

  final _$_associatedRepoAtom =
      Atom(name: 'PaymentListControllerBase._associatedRepo');

  @override
  AssociatedRepo get _associatedRepo {
    _$_associatedRepoAtom.reportRead();
    return super._associatedRepo;
  }

  @override
  set _associatedRepo(AssociatedRepo value) {
    _$_associatedRepoAtom.reportWrite(value, super._associatedRepo, () {
      super._associatedRepo = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'PaymentListControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'PaymentListControllerBase.future');

  @override
  Future<List<Associated>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<Associated>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$filterAtom = Atom(name: 'PaymentListControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$PaymentListControllerBaseActionController =
      ActionController(name: 'PaymentListControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$PaymentListControllerBaseActionController
        .startAction(name: 'PaymentListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$PaymentListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$PaymentListControllerBaseActionController
        .startAction(name: 'PaymentListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$PaymentListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$PaymentListControllerBaseActionController
        .startAction(name: 'PaymentListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$PaymentListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
isHidedButton: ${isHidedButton},
associateds: ${associateds},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
