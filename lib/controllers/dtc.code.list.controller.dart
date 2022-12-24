import 'package:flutter/material.dart';
import 'package:hcslzapp/models/dtc.code.dart';
import 'package:hcslzapp/repositories/dtc.code.repo.dart';
import 'package:mobx/mobx.dart';

part 'dtc.code.list.controller.g.dart';

class DtcCodeListController = DtcCodeListControllerBase
    with _$DtcCodeListController;

abstract class DtcCodeListControllerBase with Store {
  @observable
  var codeCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList codes = [].asObservable();

  @observable
  DtcCodeRepo _dtcCodeRepo = DtcCodeRepo();

  @observable
  Future<List<DtcCode>> future = Future<List<DtcCode>>.value([]);

  @observable
  String filter = '';

  init() {
    codes.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<DtcCode>> findAll() => _dtcCodeRepo.findAll();

  Future<List<DtcCode>> getFuture() => future = findAll();

  @action
  setFilter(String value) => filter = value.toUpperCase();

  @computed
  List<DtcCode> get listFiltered {
    if (filter.isEmpty) {
      return List<DtcCode>.from(codes);
    } else {
      return List<DtcCode>.from(
          codes.where((element) => element.code.contains(filter)));
    }
  }
}
