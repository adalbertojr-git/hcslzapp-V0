import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:hcslzapp/repositories/payment.table.repo.dart';
import 'package:mobx/mobx.dart';

part 'payment.list.controller.g.dart';

class PaymentListController = PaymentListControllerBase
    with _$PaymentListController;

abstract class PaymentListControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList associateds = [].asObservable();

  @observable
  PaymentTableRepo _paymentTableRepo = PaymentTableRepo();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Associated>> future;

  @observable
  String filter = '';

  get init {
    associateds.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;
  
  @action
  Future findAll() =>
      ObservableFuture(_associatedRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Associated>> getFuture() => future = findAll();

  @action
  setFilter(String value) => filter = value;

  @computed
  List<Associated> get listFiltered {
    if (filter.isEmpty) {
      return List<Associated>.from(associateds);
    } else {
      return List<Associated>.from(associateds
          .where((element) => element.name.contains(filter)));
    }
  }
}
