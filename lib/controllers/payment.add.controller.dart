import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/payment.selected.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/payment.months.dart';
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

  @observable
  List<String> years;

  get init {
    _initTextFields;
    payments.clear();
    formController = FormController(
      year: yearCtrl.text,
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
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Payment>> getFuture(int _paymentId) =>
      future = findByAssociatedIdToList(_paymentId);

  @action
  Future update() =>
      ObservableFuture(_paymentRepo.update(_setValues()).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future save() =>
      ObservableFuture(_paymentRepo.save(_setValues()).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Payment _setValues() {
    return Payment(
        id: payment != null ? payment.id : int.parse('0'),
        year: yearCtrl.text,
        associated: associated,
        paymentMonths: _setPaymentMonths());
  }

  @action
  setYears(List<String> value) => years = value;

  bool get hasErrors => hasErrorYear;

  bool get hasErrorYear => validateYear() != null;

  List<PaymentMonths> _setPaymentMonths() {
    List<PaymentMonths> paymentMonthsList = List<PaymentMonths>();
    paymentMonthsList.add(_setMonthsAndValues(1, janCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(2, febCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(3, marCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(4, aprCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(5, mayCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(6, junCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(7, julCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(8, augCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(9, sepCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(10, octCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(11, novCtrl.text));
    paymentMonthsList.add(_setMonthsAndValues(12, decCtrl.text));
    return paymentMonthsList;
  }

  PaymentMonths _setMonthsAndValues(int month, String value) {
    return PaymentMonths(
      id: int.parse('0'),
      month: month,
      value: value.isNotEmpty ? double.parse(value) : null,
    );
  }

  String validateYear() {
    if (formController.year.isEmpty) {
      return "Ano é obrigatório!!!";
    } else if (int.parse(formController.year) < 2018) {
      return "Ano deve ser maior que 2018";
    } else if (this.years.contains(formController.year)) {
      return "Ano informado já cadastrado";
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String year}) {
    super.year = year;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String year;

  @action
  changeYear(String value) => year = value;
}
