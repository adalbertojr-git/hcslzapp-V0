import 'dart:async';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/repositories/payment.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.selected.controller.g.dart';

class PaymentSelectedController = PaymentSelectedControllerBase
    with _$PaymentSelectedController;

abstract class PaymentSelectedControllerBase with Store {
  var formController;

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
  addPayment(Payment payment) => payments.add(payment);

  @action
  Future findByAssociatedIdToList(int id) => ObservableFuture(
              _paymentRepo.findByAssociatedIdToList(id).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Payment>> getFuture(int id) =>
      future = findByAssociatedIdToList(id);

  @action
  Future deleteById(Payment payment) =>
      ObservableFuture(_paymentRepo.deleteById(payment).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);
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
