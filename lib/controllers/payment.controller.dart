import 'dart:async';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/repositories/payment.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.controller.g.dart';

class PaymentController = PaymentControllerBase with _$PaymentController;

abstract class PaymentControllerBase with Store {
  var formController;

  @observable
  ObservableFuture<List<Payment>> paymentListFuture;

  @observable
  bool isHideButton = true;

  @observable
  ObservableList payments = [].asObservable();

  Payment payment;

  final PaymentRepo _paymentRepo = PaymentRepo();

  String errorMsg;

  Future<List<Payment>> future;

  get init {
    payments.clear();
  }

  @action
  bool hideButton() => isHideButton = !isHideButton;

  @action
  Future findOne(int id) => paymentListFuture = ObservableFuture(
              _paymentRepo.findByIdToList(id).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Payment>> getFuture(int _paymentId) =>
      future = findOne(_paymentId);
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
