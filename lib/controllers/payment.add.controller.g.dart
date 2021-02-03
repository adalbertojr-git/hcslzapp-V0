// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentAddController on PaymentAddControllerBase, Store {
  final _$idCtrlAtom = Atom(name: 'PaymentAddControllerBase.idCtrl');

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

  final _$nameCtrlAtom = Atom(name: 'PaymentAddControllerBase.nameCtrl');

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

  final _$yearCtrlAtom = Atom(name: 'PaymentAddControllerBase.yearCtrl');

  @override
  TextEditingController get yearCtrl {
    _$yearCtrlAtom.reportRead();
    return super.yearCtrl;
  }

  @override
  set yearCtrl(TextEditingController value) {
    _$yearCtrlAtom.reportWrite(value, super.yearCtrl, () {
      super.yearCtrl = value;
    });
  }

  final _$janCtrlAtom = Atom(name: 'PaymentAddControllerBase.janCtrl');

  @override
  TextEditingController get janCtrl {
    _$janCtrlAtom.reportRead();
    return super.janCtrl;
  }

  @override
  set janCtrl(TextEditingController value) {
    _$janCtrlAtom.reportWrite(value, super.janCtrl, () {
      super.janCtrl = value;
    });
  }

  final _$fevCtrlAtom = Atom(name: 'PaymentAddControllerBase.fevCtrl');

  @override
  TextEditingController get fevCtrl {
    _$fevCtrlAtom.reportRead();
    return super.fevCtrl;
  }

  @override
  set fevCtrl(TextEditingController value) {
    _$fevCtrlAtom.reportWrite(value, super.fevCtrl, () {
      super.fevCtrl = value;
    });
  }

  final _$marCtrlAtom = Atom(name: 'PaymentAddControllerBase.marCtrl');

  @override
  TextEditingController get marCtrl {
    _$marCtrlAtom.reportRead();
    return super.marCtrl;
  }

  @override
  set marCtrl(TextEditingController value) {
    _$marCtrlAtom.reportWrite(value, super.marCtrl, () {
      super.marCtrl = value;
    });
  }

  final _$abrCtrlAtom = Atom(name: 'PaymentAddControllerBase.abrCtrl');

  @override
  TextEditingController get abrCtrl {
    _$abrCtrlAtom.reportRead();
    return super.abrCtrl;
  }

  @override
  set abrCtrl(TextEditingController value) {
    _$abrCtrlAtom.reportWrite(value, super.abrCtrl, () {
      super.abrCtrl = value;
    });
  }

  final _$paymentsAtom = Atom(name: 'PaymentAddControllerBase.payments');

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

  final _$paymentAtom = Atom(name: 'PaymentAddControllerBase.payment');

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
      Atom(name: 'PaymentAddControllerBase._paymentRepo');

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

  final _$errorMsgAtom = Atom(name: 'PaymentAddControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'PaymentAddControllerBase.future');

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

  final _$PaymentAddControllerBaseActionController =
      ActionController(name: 'PaymentAddControllerBase');

  @override
  Future<dynamic> findOne(int id) {
    final _$actionInfo = _$PaymentAddControllerBaseActionController.startAction(
        name: 'PaymentAddControllerBase.findOne');
    try {
      return super.findOne(id);
    } finally {
      _$PaymentAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
nameCtrl: ${nameCtrl},
yearCtrl: ${yearCtrl},
janCtrl: ${janCtrl},
fevCtrl: ${fevCtrl},
marCtrl: ${marCtrl},
abrCtrl: ${abrCtrl},
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
