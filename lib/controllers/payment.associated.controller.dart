import 'dart:async';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/repositories/payment.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.associated.controller.g.dart';

class PaymentAssociatedController = PaymentAssociatedControllerBase
    with _$PaymentAssociatedController;

abstract class PaymentAssociatedControllerBase with Store {
  @observable
  bool isHidedButton = true;

  @observable
  ObservableList payments = [].asObservable();

  @observable
  Payment payment;

  @observable
  PaymentRepo _paymentRepo = PaymentRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Payment>> future;

  get init {
    payments.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  setPayments(Payment payment) => payments.add(payment);

  @action
  Future findByAssociatedIdToList(int id) => ObservableFuture(
      _paymentRepo.findByAssociatedIdToList(id).then((value) => value))
      .catchError((e) {
    errorMsg = "${e.message}";
  }, test: (e) => e is Exception);

  @action
  Future<List<Payment>> getFuture(int id) =>
      future = findByAssociatedIdToList(id);

  @action
  Future deleteById(Payment payment) =>
      ObservableFuture(_paymentRepo.deleteById(payment).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  List<String> loadYears() {
    List<String> years = List();
    payments.forEach((element) {
      years.add(element.year);
    });
    return years;
  }
}
