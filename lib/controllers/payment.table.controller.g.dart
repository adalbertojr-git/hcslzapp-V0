// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.table.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentTableController on PaymentTableControllerBase, Store {
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
  String toString() {
    return '''
payments: ${payments},
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
