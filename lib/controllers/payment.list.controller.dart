import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:hcslzapp/repositories/payment.table.repo.dart';
import 'package:mobx/mobx.dart';

import '../models/associated.dto.dart';

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
  String errorMsg = "";

  @observable
  Future<List<AssociatedDTO>> future = Future<List<AssociatedDTO>>.value([]);

  @observable
  String filter = '';

  init() {
    associateds.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<AssociatedDTO>> findAll() =>
      ObservableFuture(_associatedRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<List<AssociatedDTO>> getFuture() => future = findAll();

  @action
  setFilter(String value) => filter = value;

  @computed
  List<AssociatedDTO> get listFiltered {
    if (filter.isEmpty) {
      return List<AssociatedDTO>.from(associateds);
    } else {
      return List<AssociatedDTO>.from(
          associateds.where((element) => element.name.contains(filter)));
    }
  }
}
