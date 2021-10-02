import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/role.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'management.list.controller.g.dart';

class ManagementListController = ManagementListControllerBase
    with _$ManagementListController;

abstract class ManagementListControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList associateds = [].asObservable();

  @observable
  Associated associated;

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Associated>> future;

  @observable
  String filter = '';

  init() {
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

  loadAdmins(List<Associated> list) {
    for (Associated associated in list) {
      if (associated.authenticate.roles
          .any((Role r) => r.profile == ADMIN)) {
        associateds.add(associated);
      }
    }
  }

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
