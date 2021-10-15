import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/role.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:hcslzapp/repositories/management.repo.dart';
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
  ManagementRepo _managementRepo = ManagementRepo();

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

  @action
  Future deleteById(Associated associated) =>
      ObservableFuture(_managementRepo.deleteById(associated).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  loadAdmins(List<Associated> list) {
    for (Associated associated in list) {
      if (associated.authenticate.roles
          .any((Role r) => r.profile == ADMIN)) {
        associateds.add(associated);
      }
    }
  }
}
