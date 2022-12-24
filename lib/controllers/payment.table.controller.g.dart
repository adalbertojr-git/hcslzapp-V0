// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.table.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentTableController on PaymentTableControllerBase, Store {
  Computed<List<PaymentTable>>? _$listFilteredComputed;

  @override
  List<PaymentTable> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<PaymentTable>>(() => super.listFiltered,
              name: 'PaymentTableControllerBase.listFiltered'))
      .value;

  late final _$nameCtrlAtom =
      Atom(name: 'PaymentTableControllerBase.nameCtrl', context: context);

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

  late final _$isHidedButtonAtom =
      Atom(name: 'PaymentTableControllerBase.isHidedButton', context: context);

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

  late final _$paymentsAtom =
      Atom(name: 'PaymentTableControllerBase.payments', context: context);

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

  late final _$_paymentTableRepoAtom = Atom(
      name: 'PaymentTableControllerBase._paymentTableRepo', context: context);

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

  late final _$futureAtom =
      Atom(name: 'PaymentTableControllerBase.future', context: context);

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

  late final _$filterAtom =
      Atom(name: 'PaymentTableControllerBase.filter', context: context);

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

  late final _$totalAtom =
      Atom(name: 'PaymentTableControllerBase.total', context: context);

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$PaymentTableControllerBaseActionController =
      ActionController(name: 'PaymentTableControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$PaymentTableControllerBaseActionController
        .startAction(name: 'PaymentTableControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$PaymentTableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<PaymentTable>> findAll() {
    final _$actionInfo = _$PaymentTableControllerBaseActionController
        .startAction(name: 'PaymentTableControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$PaymentTableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getTotal() {
    final _$actionInfo = _$PaymentTableControllerBaseActionController
        .startAction(name: 'PaymentTableControllerBase.getTotal');
    try {
      return super.getTotal();
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
isHidedButton: ${isHidedButton},
payments: ${payments},
future: ${future},
filter: ${filter},
total: ${total},
listFiltered: ${listFiltered}
    ''';
  }
}
