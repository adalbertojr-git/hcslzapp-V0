// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.associated.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentAssociatedController on PaymentAssociatedControllerBase, Store {
  late final _$isHidedButtonAtom = Atom(
      name: 'PaymentAssociatedControllerBase.isHidedButton', context: context);

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
      Atom(name: 'PaymentAssociatedControllerBase.payments', context: context);

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

  late final _$paymentAtom =
      Atom(name: 'PaymentAssociatedControllerBase.payment', context: context);

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

  late final _$_paymentRepoAtom = Atom(
      name: 'PaymentAssociatedControllerBase._paymentRepo', context: context);

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

  late final _$futureAtom =
      Atom(name: 'PaymentAssociatedControllerBase.future', context: context);

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

  late final _$totalAtom =
      Atom(name: 'PaymentAssociatedControllerBase.total', context: context);

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

  late final _$PaymentAssociatedControllerBaseActionController =
      ActionController(
          name: 'PaymentAssociatedControllerBase', context: context);

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
  Future<List<Payment>> findByAssociatedIdToList(int id) {
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
  Future<Response> deleteById(Payment payment) {
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
future: ${future},
total: ${total}
    ''';
  }
}
