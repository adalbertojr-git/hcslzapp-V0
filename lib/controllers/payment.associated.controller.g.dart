// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.associated.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentAssociatedController on PaymentAssociatedControllerBase, Store {
  final _$isHidedButtonAtom =
      Atom(name: 'PaymentAssociatedControllerBase.isHidedButton');

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

  final _$paymentsAtom = Atom(name: 'PaymentAssociatedControllerBase.payments');

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

  final _$paymentAtom = Atom(name: 'PaymentAssociatedControllerBase.payment');

  @override
  Payment get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(Payment value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  final _$_paymentRepoAtom =
      Atom(name: 'PaymentAssociatedControllerBase._paymentRepo');

  @override
  PaymentRepo get _paymentRepo {
    _$_paymentRepoAtom.reportRead();
    return super._paymentRepo;
  }

  @override
  set _paymentRepo(PaymentRepo value) {
    _$_paymentRepoAtom.reportWrite(value, super._paymentRepo, () {
      super._paymentRepo = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'PaymentAssociatedControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'PaymentAssociatedControllerBase.future');

  @override
  Future<List<Payment>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<Payment>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$totalAtom = Atom(name: 'PaymentAssociatedControllerBase.total');

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

  final _$PaymentAssociatedControllerBaseActionController =
      ActionController(name: 'PaymentAssociatedControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo =
        _$PaymentAssociatedControllerBaseActionController.startAction(
            name: 'PaymentAssociatedControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$PaymentAssociatedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findByAssociatedIdToList(int id) {
    final _$actionInfo =
        _$PaymentAssociatedControllerBaseActionController.startAction(
            name: 'PaymentAssociatedControllerBase.findByAssociatedIdToList');
    try {
      return super.findByAssociatedIdToList(id);
    } finally {
      _$PaymentAssociatedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Payment>> getFuture(int id) {
    final _$actionInfo = _$PaymentAssociatedControllerBaseActionController
        .startAction(name: 'PaymentAssociatedControllerBase.getFuture');
    try {
      return super.getFuture(id);
    } finally {
      _$PaymentAssociatedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> deleteById(Payment payment) {
    final _$actionInfo = _$PaymentAssociatedControllerBaseActionController
        .startAction(name: 'PaymentAssociatedControllerBase.deleteById');
    try {
      return super.deleteById(payment);
    } finally {
      _$PaymentAssociatedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getTotal(String year) {
    final _$actionInfo = _$PaymentAssociatedControllerBaseActionController
        .startAction(name: 'PaymentAssociatedControllerBase.getTotal');
    try {
      return super.getTotal(year);
    } finally {
      _$PaymentAssociatedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidedButton: ${isHidedButton},
payments: ${payments},
payment: ${payment},
errorMsg: ${errorMsg},
future: ${future},
total: ${total}
    ''';
  }
}
