import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/dtc.code.ecm.dart';
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
    codes.addAll(DtcCodeECM().load);
  }

  @action
  setFilter(String value) => filter = value.toUpperCase();

  @computed
  List<DtcCodeECM> get listFiltered {
    if (filter.isEmpty) {
      return List<DtcCodeECM>.from(codes);
    } else {
      return List<DtcCodeECM>.from(
          codes.where((element) => element.code.contains(filter)));
    }
  }
}
