// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtc.code.abbreviation.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DtcCodeAbbreviationListController
    on DtcCodeAbbreviationListControllerBase, Store {
  Computed<List<DtcCodeAbbreviation>>? _$listFilteredComputed;

  @override
  List<DtcCodeAbbreviation> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<DtcCodeAbbreviation>>(() => super.listFiltered,
              name: 'DtcCodeAbbreviationListControllerBase.listFiltered'))
      .value;

  final _$codeCtrlAtom =
      Atom(name: 'DtcCodeAbbreviationListControllerBase.codeCtrl');

  @override
  TextEditingController get codeCtrl {
    _$codeCtrlAtom.reportRead();
    return super.codeCtrl;
  }

  @override
  set codeCtrl(TextEditingController value) {
    _$codeCtrlAtom.reportWrite(value, super.codeCtrl, () {
      super.codeCtrl = value;
    });
  }

  final _$isHidedButtonAtom =
      Atom(name: 'DtcCodeAbbreviationListControllerBase.isHidedButton');

  @override
  bool get isHidedButton {
    _$isHidedButtonAtom.reportRead();
    return super.isHidedButton;
  }

  @override
  set isHidedButton(bool value) {
    _$isHidedButtonAtom.reportWrite(value, super.isHidedButton, () {
      super.isHidedButton = value;
    });
  }

  final _$abbreviationsAtom =
      Atom(name: 'DtcCodeAbbreviationListControllerBase.abbreviations');

  @override
  ObservableList<dynamic> get abbreviations {
    _$abbreviationsAtom.reportRead();
    return super.abbreviations;
  }

  @override
  set abbreviations(ObservableList<dynamic> value) {
    _$abbreviationsAtom.reportWrite(value, super.abbreviations, () {
      super.abbreviations = value;
    });
  }

  final _$_dtcCodeAbbreviationRepoAtom = Atom(
      name: 'DtcCodeAbbreviationListControllerBase._dtcCodeAbbreviationRepo');

  @override
  DtcCodeAbbreviationRepo get _dtcCodeAbbreviationRepo {
    _$_dtcCodeAbbreviationRepoAtom.reportRead();
    return super._dtcCodeAbbreviationRepo;
  }

  @override
  set _dtcCodeAbbreviationRepo(DtcCodeAbbreviationRepo value) {
    _$_dtcCodeAbbreviationRepoAtom
        .reportWrite(value, super._dtcCodeAbbreviationRepo, () {
      super._dtcCodeAbbreviationRepo = value;
    });
  }

  final _$errorMsgAtom =
      Atom(name: 'DtcCodeAbbreviationListControllerBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$futureAtom =
      Atom(name: 'DtcCodeAbbreviationListControllerBase.future');

  @override
  Future<dynamic> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<dynamic> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$filterAtom =
      Atom(name: 'DtcCodeAbbreviationListControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$DtcCodeAbbreviationListControllerBaseActionController =
      ActionController(name: 'DtcCodeAbbreviationListControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo =
        _$DtcCodeAbbreviationListControllerBaseActionController.startAction(
            name: 'DtcCodeAbbreviationListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$DtcCodeAbbreviationListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$DtcCodeAbbreviationListControllerBaseActionController
        .startAction(name: 'DtcCodeAbbreviationListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$DtcCodeAbbreviationListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$DtcCodeAbbreviationListControllerBaseActionController
        .startAction(name: 'DtcCodeAbbreviationListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$DtcCodeAbbreviationListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
codeCtrl: ${codeCtrl},
isHidedButton: ${isHidedButton},
abbreviations: ${abbreviations},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
