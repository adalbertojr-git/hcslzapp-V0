import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/dtc.code.abbreviation.dart';
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
    abbreviations.addAll(DtcCodeAbbreviation().load);
  }

  @action
  setFilter(String value) => filter = value.toUpperCase();

  @computed
  List<DtcCodeAbbreviation> get listFiltered {
    if (filter.isEmpty) {
      return List<DtcCodeAbbreviation>.from(abbreviations);
    } else {
      return List<DtcCodeAbbreviation>.from(
          abbreviations.where((element) => element.code.contains(filter)));
    }
  }
}
