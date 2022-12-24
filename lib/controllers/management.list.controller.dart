import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/template.dart';
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
  Associated associated = Template().loadAssociated();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  ManagementRepo _managementRepo = ManagementRepo();

  @observable
  Future<List<Associated>> future = Future<List<Associated>>.value([]);

  @observable
  String filter = '';

  init() {
    associateds.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Associated>> findAllAdminToList() => ObservableFuture(
      _associatedRepo.findAllAdminToList().then((value) => value));

  Future<List<Associated>> getFuture() => future = findAllAdminToList();

  @action
  Future deleteById(Associated associated) => ObservableFuture(
      _managementRepo.deleteById(associated).then((value) => value));
}
