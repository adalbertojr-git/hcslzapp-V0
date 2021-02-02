import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/payment.table.dart';
import 'package:hcslzapp/repositories/payment.table.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.table.controller.g.dart';

class PaymentTableController = PaymentTableControllerBase
    with _$PaymentTableController;

abstract class PaymentTableControllerBase with Store {
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

  @observable
  String filter = '';

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

  @action
  setFilter(String value) => filter = value;

  @computed
  List<PaymentTable> get listFiltered {
    if (filter.isEmpty) {
      return List<PaymentTable>.from(payments);
    } else {
      return List<PaymentTable>.from(payments
          .where((element) => element.name.contains(filter)));
    }
  }
}
