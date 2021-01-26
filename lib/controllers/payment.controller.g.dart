// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentController on PaymentControllerBase, Store {
  final _$paymentListFutureAtom =
      Atom(name: 'PaymentControllerBase.paymentListFuture');

  @override
  ObservableFuture<List<Payment>> get paymentListFuture {
    _$paymentListFutureAtom.reportRead();
    return super.paymentListFuture;
  }

  @override
  set paymentListFuture(ObservableFuture<List<Payment>> value) {
    _$paymentListFutureAtom.reportWrite(value, super.paymentListFuture, () {
      super.paymentListFuture = value;
    });
  }

  final _$isHideButtonAtom = Atom(name: 'PaymentControllerBase.isHideButton');

  @override
  bool get isHideButton {
    _$isHideButtonAtom.reportRead();
    return super.isHideButton;
  }

  @override
  set isHideButton(bool value) {
    _$isHideButtonAtom.reportWrite(value, super.isHideButton, () {
      super.isHideButton = value;
    });
  }

  final _$paymentsAtom = Atom(name: 'PaymentControllerBase.payments');

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

  final _$PaymentControllerBaseActionController =
      ActionController(name: 'PaymentControllerBase');

  @override
  bool hideButton() {
    final _$actionInfo = _$PaymentControllerBaseActionController.startAction(
        name: 'PaymentControllerBase.hideButton');
    try {
      return super.hideButton();
    } finally {
      _$PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findOne(int id) {
    final _$actionInfo = _$PaymentControllerBaseActionController.startAction(
        name: 'PaymentControllerBase.findOne');
    try {
      return super.findOne(id);
    } finally {
      _$PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paymentListFuture: ${paymentListFuture},
isHideButton: ${isHideButton},
payments: ${payments}
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
