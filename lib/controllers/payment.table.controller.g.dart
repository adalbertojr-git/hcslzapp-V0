// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.table.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentTableController on PaymentTableControllerBase, Store {
  Computed<List<PaymentTable>> _$listFilteredComputed;

  @override
  List<PaymentTable> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<PaymentTable>>(() => super.listFiltered,
              name: 'PaymentTableControllerBase.listFiltered'))
      .value;

  final _$nameCtrlAtom = Atom(name: 'PaymentTableControllerBase.nameCtrl');

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

  final _$paymentsAtom = Atom(name: 'PaymentTableControllerBase.payments');

  @override
  ObservableList<dynamic> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<dynamic> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  final _$_paymentTableRepoAtom =
      Atom(name: 'PaymentTableControllerBase._paymentTableRepo');

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

  final _$errorMsgAtom = Atom(name: 'PaymentTableControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'PaymentTableControllerBase.future');

  @override
  Future<List<PaymentTable>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<PaymentTable>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$filterAtom = Atom(name: 'PaymentTableControllerBase.filter');

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

  final _$PaymentTableControllerBaseActionController =
      ActionController(name: 'PaymentTableControllerBase');

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$PaymentTableControllerBaseActionController
        .startAction(name: 'PaymentTableControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$PaymentTableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$PaymentTableControllerBaseActionController
        .startAction(name: 'PaymentTableControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$PaymentTableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
payments: ${payments},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
