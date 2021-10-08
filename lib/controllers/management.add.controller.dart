import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/controllers/item.model.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/role.dart';
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
  String errorMsg;

  @observable
  Future<List<Associated>> future;

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
  Future findAll() =>
      ObservableFuture(_associatedRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Associated>> getFuture() => future = findAll();

  @action
  Future save() => ObservableFuture(_managementRepo
          .save(List<int>.from(ids))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  loadNotAdmins(List<Associated> list) {
    for (Associated associated in list) {
      if (!associated.authenticate.roles.any((Role r) => r.profile == ADMIN)) {
        listItems.add(
          ItemModel(
              id: associated.id,
              name: associated.name,
              phone: associated.phone,
              status: associated.status,
              authenticate: associated.authenticate,
              check: false),
        );
      }
    }
  }

  @action
  setFilter(String value) => filter = value;

  @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty) {
      return List<ItemModel>.from(listItems);
    } else {
      return List<ItemModel>.from(
          listItems.where((element) => element.name.contains(filter)));
    }
  }
}
