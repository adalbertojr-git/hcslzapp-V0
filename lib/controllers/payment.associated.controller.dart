import 'dart:async';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/template.dart';
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
  Payment payment = Template().loadPayment();

  @observable
  PaymentRepo _paymentRepo = PaymentRepo();

  @observable
  String errorMsg = "";

  @observable
  Future<List<Payment>> future = Future<List<Payment>>.value([]);

  @observable
  double total = 0.0;

  init() {
    payments.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Payment>> findByAssociatedIdToList(int id) => ObservableFuture(
              _paymentRepo.findByAssociatedIdToList(id).then((value) => value))
          .catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future<List<Payment>> getFuture(int id) =>
      future = findByAssociatedIdToList(id);

  @action
  Future deleteById(Payment payment) =>
      ObservableFuture(_paymentRepo.deleteById(payment).then((value) => value))
          .catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  List<String> loadYears() {
    List<String> years = List.filled(0, '', growable: true);
    payments.forEach((element) {
      years.add(element.year);
    });
    return years;
  }

  String getMonthName(int i) {
    Map _months = {
      1: 'Janeiro',
      2: 'Fevereiro',
      3: 'Março',
      4: 'Abril',
      5: 'Maio',
      6: 'Junho',
      7: 'Julho',
      8: 'Agosto',
      9: 'Setembro',
      10: 'Outubro',
      11: 'Novembro',
      12: 'Dezembro',
    };
    return _months[i];
  }

  @action
  double getTotal(String year) {
    this.total = 0;
    var list = payments.where((element) => element.year == year);
    list.forEach((element) {
      element.paymentMonths.forEach((e) {
        total = total + e.value;
      });
    });
    return total;
  }
}
