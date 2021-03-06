import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'dtc.code.abbreviation.list.controller.g.dart';

class DtcCodeAbbreviationListController = DtcCodeAbbreviationListControllerBase
    with _$DtcCodeAbbreviationListController;

abstract class DtcCodeAbbreviationListControllerBase with Store {
  @observable
  var codeCtrl = TextEditingController();

  @observable
  ObservableList abbreviations = [].asObservable();

  @observable
  String filter = '';

  get init {
    abbreviations.clear();
    List<Abbreviation> abbreviationsList = [
      Abbreviation(
          code: 'ABS',
          description: 'Anti-Lock Braking System'),
      Abbreviation(
          code: 'ACR',
          description: 'Automatic Compression Release'),
    ];
    abbreviations.addAll(abbreviationsList);
  }

  @action
  setFilter(String value) => filter = value.toUpperCase();

  @computed
  List<Abbreviation> get listFiltered {
    if (filter.isEmpty) {
      return List<Abbreviation>.from(abbreviations);
    } else {
      return List<Abbreviation>.from(
          abbreviations.where((element) => element.code.contains(filter)));
    }
  }
}

class Abbreviation {
  String code;
  String description;

  Abbreviation({this.code, this.description});
}
