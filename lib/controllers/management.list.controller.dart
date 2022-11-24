import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/role.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:hcslzapp/repositories/management.repo.dart';
import 'package:mobx/mobx.dart';

import '../models/associated.dto.dart';

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
  String errorMsg = '';

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
  Future<List<AssociatedDTO>> findAllAdminToList() =>
      ObservableFuture(_associatedRepo.findAllAdminToList().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<List<AssociatedDTO>> getFuture() => future = findAllAdminToList();

  @action
  Future deleteById(AssociatedDTO associated) => ObservableFuture(
              _managementRepo.deleteById(associated).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  loadAdmins(List<AssociatedDTO> list) {
    for (AssociatedDTO associated in list) {
      if (associated.authenticate.roles.any((Role r) => r.profile == ADMIN)) {
        associateds.add(associated);
      }
    }
  }
}
