import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/template.dart';
import '../../models/associated.dart';
import '../models/associated.dto.dart';
import '../repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'associated.list.controller.g.dart';

class AssociatedListController = AssociatedListControllerBase
    with _$AssociatedListController;

abstract class AssociatedListControllerBase with Store {
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
