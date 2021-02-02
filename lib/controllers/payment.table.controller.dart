import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/payment.table.dart';
import 'package:hcslzapp/repositories/payment.table.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.table.controller.g.dart';

class PaymentTableController = PaymentTableControllerBase
    with _$PaymentTableController;

abstract class PaymentTableControllerBase with Store {
  var formController;

  @observable
  var yearCtrl = TextEditingController();

  @observable
  var nameCtrl = TextEditingController();

  @observable
  ObservableList payments = [].asObservable();

  @observable
  PaymentTableRepo _paymentTableRepo = PaymentTableRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<PaymentTable>> future;

  get init {
    payments.clear();
  }

  @action
  Future findAll() =>
      ObservableFuture(_paymentTableRepo.findAll().then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<PaymentTable>> getFuture() => future = findAll();
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String name, String email}) {
    super.name = name;
    super.email = email;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String name;

  @observable
  String email;

  @action
  changeName(String value) => name = value;

  @action
  changeEmail(String value) => email = value;
}
