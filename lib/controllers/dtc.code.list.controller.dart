import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
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
    List<DtcCodes> dtcCodesList = [
      DtcCodes(
          code: 'POO51 ',
          description: 'Heater Control Circuit 02 Sensor Low',
          group: 'Sensors and motor'),
    ];
    codes.addAll(dtcCodesList);
  }

  @action
  setFilter(String value) => filter = value;

  @computed
  List<DtcCodes> get listFiltered {
    if (filter.isEmpty) {
      return List<DtcCodes>.from(codes);
    } else {
      return List<DtcCodes>.from(
          codes.where((element) => element.code.contains(filter)));
    }
  }
}

class DtcCodes {
  String code;
  String description;
  String group;

  DtcCodes({this.code, this.description, this.group});
}
