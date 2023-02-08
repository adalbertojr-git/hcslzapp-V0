import 'package:flutter/material.dart';
import 'package:hcslzapp/models/dtc.code.abbreviation.dart';
import 'package:hcslzapp/repositories/dtc.code.abbreviation.repo.dart';
import 'package:mobx/mobx.dart';

part 'dtc.code.abbreviation.list.controller.g.dart';

class DtcCodeAbbreviationListController = DtcCodeAbbreviationListControllerBase
    with _$DtcCodeAbbreviationListController;

abstract class DtcCodeAbbreviationListControllerBase with Store {
  @observable
  var codeCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList abbreviations = [].asObservable();

  @observable
  DtcCodeAbbreviationRepo _dtcCodeAbbreviationRepo = DtcCodeAbbreviationRepo();

  @observable
  Future<List<DtcCodeAbbreviation>> future =
      Future<List<DtcCodeAbbreviation>>.value([]);

  @observable
  String filter = '';

  init() {
    abbreviations.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<DtcCodeAbbreviation>> findAll() =>
      _dtcCodeAbbreviationRepo.findAll();

  Future<List<DtcCodeAbbreviation>> getFuture() => future = findAll();

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
