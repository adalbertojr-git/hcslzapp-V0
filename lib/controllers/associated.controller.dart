import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'associated.controller.g.dart';

class AssociatedController = AssociatedControllerBase
    with _$AssociatedController;

abstract class AssociatedControllerBase with Store {
  @observable
  var idCtrl = TextEditingController();

  @observable
  var nameCtrl = TextEditingController();

  @observable
  var phoneCtrl = TextEditingController();

  @observable
  var emailCtrl = TextEditingController();

  @observable
  var sponsorCtrl = TextEditingController();

  @observable
  var associatedTypeCtrl = TextEditingController();

  @observable
  var cnhCtrl = TextEditingController();

  @observable
  var cpfCtrl = TextEditingController();

  @observable
  var bloodTypeCtrl = TextEditingController();

  @observable
  var dateBirthCtrl = TextEditingController();

  @observable
  var dateShieldCtrl = TextEditingController();

  @observable
  bool isHideButton = true;

  @observable
  ObservableFuture<List<Associated>> associatedListFuture;

  @observable
  ObservableList dependents = [].asObservable();

  @observable
  ObservableList motorcycles = [].asObservable();

  @observable
  String currentBloodType;

  final AssociatedRepo _associatedRepo = AssociatedRepo();
  String errorMsg;

  @action
  hideButton() => isHideButton = !isHideButton;

  @action
  Future fetchAssociated(int id) =>
      associatedListFuture = ObservableFuture(_associatedRepo
          .findByIdAssociatedToList(id)
          .then((associated) => associated)).catchError((e) {
        this.errorMsg = "TimeOutException: ${e.toString()}";
      }, test: (e) => e is TimeoutException).catchError((e) {
        this.errorMsg = "Exception: ${e.toString()}";
      }, test: (e) => e is Exception);

  @action
  dependentAdd(Dependent dependent) {
    dependents.add(dependent);
    print('Dependentes: $dependents');
  }

  @action
  dependentRemoveAt(int index) {
    dependents.removeAt(index);
    print('Dependentes: $dependents');
  }

  @action
  motorcycleAdd(Motorcycle motorcycle) {
    motorcycles.add(motorcycle);
    print('Motocicletas: $motorcycles');
  }

  @action
  motorcycleRemoveAt(int index) {
    motorcycles.removeAt(index);
    print('Motocicletas: $motorcycles');
  }

  @action
  changedDropDownItem(String selected) {
    currentBloodType = selected;
  }

}
