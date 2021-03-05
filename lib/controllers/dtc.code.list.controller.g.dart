// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtc.code.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DtcCodeListController on DtcCodeListControllerBase, Store {
  Computed<List<DtcCodes>> _$listFilteredComputed;

  @override
  List<DtcCodes> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<DtcCodes>>(() => super.listFiltered,
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
codes: ${codes},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
