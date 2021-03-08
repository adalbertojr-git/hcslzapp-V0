import 'package:flutter/material.dart';
import 'package:hcslzapp/models/dtc.code.dart';
import 'package:mobx/mobx.dart';

part 'dtc.code.list.controller.g.dart';

class DtcCodeListController = DtcCodeListControllerBase
    with _$DtcCodeListController;

abstract class DtcCodeListControllerBase with Store {
  @observable
  var codeCtrl = TextEditingController();

  @observable
  ObservableList codes = [].asObservable();

  @observable
  String filter = '';

  get init {
    codes.clear();
    codes.addAll(DtcCode().loadECMList);
    codes.addAll(DtcCode().loadABSList);
    codes.addAll(DtcCode().loadBCMList);
  }

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
