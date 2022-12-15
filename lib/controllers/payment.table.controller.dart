import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/repositories/payment.table.repo.dart';
import 'package:mobx/mobx.dart';
import '../models/payment.table.dart';

part 'payment.table.controller.g.dart';

class PaymentTableController = PaymentTableControllerBase
    with _$PaymentTableController;

abstract class PaymentTableControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList payments = [].asObservable();

  @observable
  PaymentTableRepo _paymentTableRepo = PaymentTableRepo();

  @observable
  late String errorMsg;

  @observable
  Future<List<PaymentTable>> future =
      Future<List<PaymentTable>>.value([]);

  @observable
  String filter = '';

  @observable
  double total = 0;

  init() {
    payments.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<PaymentTable>> findAll() => ObservableFuture(
      _paymentTableRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<List<PaymentTable>> getFuture() => future = findAll();

  @action
  double getTotal() {
    double total = 0;
    for(var item in listFiltered) {
      total = total + item.total;
    }
    return total;
  }

  @action
  setFilter(String value) => filter = value;

  @computed
  List<PaymentTable> get listFiltered {
    if (filter.isEmpty) {
      return List<PaymentTable>.from(payments);
    } else {
      return List<PaymentTable>.from(
          payments.where((element) => element.year.contains(filter)));
    }
  }
}
