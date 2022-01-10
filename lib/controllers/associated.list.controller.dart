import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/associated.dart';
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
  late Associated associated;

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  late String errorMsg;

  @observable
  //late Future<List<Associated>> future;
  late Future future;

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

  //Future<List<Associated>> getFuture() => future = findAll();
  Future getFuture() => future = findAll();

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
