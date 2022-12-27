import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';
import '../models/associated.dart';

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
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String filter = '';

  init() {
    associateds.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Associated>> findAll() => _associatedRepo.findAll();

  @action
  setFilter(String value) => filter = value;

  @computed
  List<Associated> get listFiltered {
    if (filter.isEmpty) {
      return List<Associated>.from(associateds);
    } else {
      return List<Associated>.from(
          associateds.where((element) => element.name.contains(filter)));
    }
  }
}
