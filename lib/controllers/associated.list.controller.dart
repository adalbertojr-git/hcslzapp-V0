import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/template.dart';
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
  Associated associated = Template().loadAssociated();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String errorMsg = '';

  @observable
  Future<List<Associated>> future = Future<List<Associated>>.value([]);

  @observable
  String filter = '';

  init() {
    associateds.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

/*  @action
  Future<List<Associated>> findAll2() =>
      ObservableFuture(_associatedRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
        return Future.error(e);
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
        return Future.error(e);
      }, test: (e) => e is Exception);*/

  Future<List<Associated>> findAll() {
    try {
      return ObservableFuture(_associatedRepo.findAll().then((value) => value));
    } on HttpException catch (e) {
      print(e);
      errorMsg = "$e";
    } on Exception catch (e) {
      print(e);
      errorMsg = "$e";
    } catch (e) {
      print(e);
      errorMsg = "$e";
    }
    return Future.error(errorMsg);
  }

  Future<List<Associated>> getFuture() => future = findAll();

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
