import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/repositories/payment.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.add.controller.g.dart';

class PaymentAddController = PaymentAddControllerBase
    with _$PaymentAddController;

abstract class PaymentAddControllerBase with Store {
  var formController;

  @observable
  var idCtrl = TextEditingController();

  @observable
  var nameCtrl = TextEditingController();

  @observable
  var yearCtrl = TextEditingController();

  @observable
  var janCtrl = TextEditingController();

  @observable
  var fevCtrl = TextEditingController();

  @observable
  var marCtrl = TextEditingController();

  @observable
  var abrCtrl = TextEditingController();

  @observable
  var maiCtrl = TextEditingController();

  @observable
  var junCtrl = TextEditingController();

  @observable
  var julCtrl = TextEditingController();

  @observable
  var agoCtrl = TextEditingController();

  @observable
  var setCtrl = TextEditingController();

  @observable
  var outCtrl = TextEditingController();

  @observable
  var novCtrl = TextEditingController();

  @observable
  var dezCtrl = TextEditingController();

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
    _initTextFields;
    payments.clear();
  }

  get _initTextFields {
    idCtrl.text = payment != null ? payment.id.toString() : null;
    nameCtrl.text = payment != null ? payment.associated.name : null;
    yearCtrl.text = payment != null ? payment.year : null;
    if (payment != null) {
      payment.paymentMonths.forEach((element) {
        if (element.month == 1) {
          janCtrl.text = element.value.toString();
        }
        switch (element.month) {
          case 1:
            janCtrl.text = element.value.toString();
            break;
          case 2:
            fevCtrl.text = element.value.toString();
            break;
          case 3:
            marCtrl.text = element.value.toString();
            break;
          case 4:
            abrCtrl.text = element.value.toString();
            break;
          case 5:
            maiCtrl.text = element.value.toString();
            break;
          case 6:
            junCtrl.text = element.value.toString();
            break;
          case 7:
            julCtrl.text = element.value.toString();
            break;
          case 8:
            agoCtrl.text = element.value.toString();
            break;
          case 9:
            setCtrl.text = element.value.toString();
            break;
          case 10:
            outCtrl.text = element.value.toString();
            break;
          case 11:
            novCtrl.text = element.value.toString();
            break;
          case 12:
            dezCtrl.text = element.value.toString();
            break;
        }
      });
    }
  }

  @action
  Future findByAssociatedIdToList(int id) => ObservableFuture(
              _paymentRepo.findByAssociatedIdToList(id).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Payment>> getFuture(int _paymentId) =>
      future = findByAssociatedIdToList(_paymentId);
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
