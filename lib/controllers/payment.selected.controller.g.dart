// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.selected.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentSelectedController on PaymentSelectedControllerBase, Store {
  final _$isHidedButtonAtom =
      Atom(name: 'PaymentSelectedControllerBase.isHidedButton');

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

  final _$paymentsAtom = Atom(name: 'PaymentSelectedControllerBase.payments');

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

  final _$paymentAtom = Atom(name: 'PaymentSelectedControllerBase.payment');

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
      Atom(name: 'PaymentSelectedControllerBase._paymentRepo');

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

  final _$errorMsgAtom = Atom(name: 'PaymentSelectedControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'PaymentSelectedControllerBase.future');

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

  final _$PaymentSelectedControllerBaseActionController =
      ActionController(name: 'PaymentSelectedControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$PaymentSelectedControllerBaseActionController
        .startAction(name: 'PaymentSelectedControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$PaymentSelectedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findByAssociatedIdToList(int id) {
    final _$actionInfo =
        _$PaymentSelectedControllerBaseActionController.startAction(
            name: 'PaymentSelectedControllerBase.findByAssociatedIdToList');
    try {
      return super.findByAssociatedIdToList(id);
    } finally {
      _$PaymentSelectedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidedButton: ${isHidedButton},
payments: ${payments},
payment: ${payment},
errorMsg: ${errorMsg},
future: ${future}
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
