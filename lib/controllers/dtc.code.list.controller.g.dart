// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtc.code.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DtcCodeListController on DtcCodeListControllerBase, Store {
  Computed<List<DtcCode>>? _$listFilteredComputed;

  @override
  List<DtcCode> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<DtcCode>>(() => super.listFiltered,
              name: 'DtcCodeListControllerBase.listFiltered'))
      .value;

  final _$codeCtrlAtom = Atom(name: 'DtcCodeListControllerBase.codeCtrl');

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
      Atom(name: 'DtcCodeListControllerBase.isHidedButton');

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

  final _$codesAtom = Atom(name: 'DtcCodeListControllerBase.codes');

  @override
  ObservableList<dynamic> get codes {
    _$codesAtom.reportRead();
    return super.codes;
  }

  @override
  set codes(ObservableList<dynamic> value) {
    _$codesAtom.reportWrite(value, super.codes, () {
      super.codes = value;
    });
  }

  final _$_dtcCodeRepoAtom =
      Atom(name: 'DtcCodeListControllerBase._dtcCodeRepo');

  @override
  DtcCodeRepo get _dtcCodeRepo {
    _$_dtcCodeRepoAtom.reportRead();
    return super._dtcCodeRepo;
  }

  @override
  set _dtcCodeRepo(DtcCodeRepo value) {
    _$_dtcCodeRepoAtom.reportWrite(value, super._dtcCodeRepo, () {
      super._dtcCodeRepo = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'DtcCodeListControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'DtcCodeListControllerBase.future');

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

  final _$filterAtom = Atom(name: 'DtcCodeListControllerBase.filter');

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

  final _$DtcCodeListControllerBaseActionController =
      ActionController(name: 'DtcCodeListControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$DtcCodeListControllerBaseActionController
        .startAction(name: 'DtcCodeListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$DtcCodeListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$DtcCodeListControllerBaseActionController
        .startAction(name: 'DtcCodeListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$DtcCodeListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$DtcCodeListControllerBaseActionController
        .startAction(name: 'DtcCodeListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$DtcCodeListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
codeCtrl: ${codeCtrl},
isHidedButton: ${isHidedButton},
codes: ${codes},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
