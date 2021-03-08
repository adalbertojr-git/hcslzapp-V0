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
    List<DtcCode> dtcCodesList = [
      DtcCode(
          code: 'P0031',
          description:
              'Sonda Lambda Dianteira HO2S Desconectado Ou Com Tensão Abaixo Do Normal',
          group: 'Monitorado pelo ECM'),
      DtcCode(
          code: 'P0032',
          description:
              'Sonda Lambda Dianteira HO2S Em Curto Ou Com Tensão Acima Do Normal',
          group: 'Monitorado pelo ECM'),
      DtcCode(
          code: 'P0051',
          description:
              'Sonda Lambda Traseira HO2S Desconectada Ou Com Tensão Abaixo Do Normal',
          group: 'Monitorado pelo ECM'),
      DtcCode(
          code: 'P0052',
          description:
              'Sonda Lambda Traseira HO2S Em Curto Ou Com Tensão Acima Do Normal',
          group: 'Monitorado pelo ECM'),
      DtcCode(
          code: 'P0072',
          description:
              'Sensor AAT Com Tensão Abaixo Do Normal',
          group: 'Monitorado pelo ECM'),
      DtcCode(
          code: 'P0073',
          description:
              'Sensor AAT Com Tensão Acima Do Normal Ou Desconectado',
          group: 'Monitorado pelo ECM'),
    ];
    codes.addAll(dtcCodesList);
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

class DtcCode {
  String code;
  String description;
  String group;

  DtcCode({this.code, this.description, this.group});
}
