import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/item.model.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:hcslzapp/repositories/management.repo.dart';
import 'package:mobx/mobx.dart';

part 'management.add.controller.g.dart';

class ManagementAddController = ManagementAddControllerBase
    with _$ManagementAddController;

abstract class ManagementAddControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  var listItems = ObservableList<ItemModel>();

  @observable
  var ids = ObservableList<int>();

  @observable
  var associateds = ObservableList<ItemModel>();

  @observable
  bool isHidedButton = true;

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  ManagementRepo _managementRepo = ManagementRepo();

  @observable
  Future<List<Associated>> future = Future<List<Associated>>.value([]);

  @observable
  String filter = '';

  init() {
    listItems.clear();
    ids.clear();
    associateds.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Associated>> findAllNotAdminToList() => ObservableFuture(
              _associatedRepo.findAllNotAdminToList().then((value) => value));

  Future<List<Associated>> getFuture() => future = findAllNotAdminToList();

  @action
  Future save() => ObservableFuture(
              _managementRepo.save(List<int>.from(ids)).then((value) => value));

  loadListItems(List<Associated> list) {
    for (Associated associated in list) {
      listItems.add(
        ItemModel(
          id: associated.id,
          name: associated.name,
          phone: associated.phone,
          status: associated.status,
          authenticate: associated.authenticate,
          check: false,
          email: '',
          user: '',
          password: '',
        ),
      );
    }
  }
}
