import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
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
  var febCtrl = TextEditingController();

  @observable
  var marCtrl = TextEditingController();

  @observable
  var aprCtrl = TextEditingController();

  @observable
  var mayCtrl = TextEditingController();

  @observable
  var junCtrl = TextEditingController();

  @observable
  var julCtrl = TextEditingController();

  @observable
  var augCtrl = TextEditingController();

  @observable
  var sepCtrl = TextEditingController();

  @observable
  var octCtrl = TextEditingController();

  @observable
  var novCtrl = TextEditingController();

  @observable
  var decCtrl = TextEditingController();

  @observable
  ObservableList payments = [].asObservable();

  @observable
  Payment payment;

  @observable
  Associated associated;

  @observable
  PaymentRepo _paymentRepo = PaymentRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Payment>> future;

  get init {
    _initTextFields;
    payments.clear();
    formController = FormController(
      name: '',
      email: '',
    );
  }

  get _initTextFields {
    idCtrl.text = payment != null ? payment.id.toString() : null;
    nameCtrl.text = payment != null ? payment.associated.name : associated.name;
    yearCtrl.text = payment != null ? payment.year : null;
    if (payment != null) {
      payment.paymentMonths.forEach((element) {
        switch (element.month) {
          case 1:
            janCtrl.text = element.value.toString();
            break;
          case 2:
            febCtrl.text = element.value.toString();
            break;
          case 3:
            marCtrl.text = element.value.toString();
            break;
          case 4:
            aprCtrl.text = element.value.toString();
            break;
          case 5:
            mayCtrl.text = element.value.toString();
            break;
          case 6:
            junCtrl.text = element.value.toString();
            break;
          case 7:
            julCtrl.text = element.value.toString();
            break;
          case 8:
            augCtrl.text = element.value.toString();
            break;
          case 9:
            sepCtrl.text = element.value.toString();
            break;
          case 10:
            octCtrl.text = element.value.toString();
            break;
          case 11:
            novCtrl.text = element.value.toString();
            break;
          case 12:
            decCtrl.text = element.value.toString();
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

  String validateName() {
    if (formController.name.isEmpty) {
      return "Ano é obrigatório!!!";
    } else if (int.parse(formController.name) < 2014){
      return "Ano deve ser maior que 2014";
    }
    //DateTime.
    return null;
  }
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
