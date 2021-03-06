// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtc.code.abbreviation.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DtcCodeAbbreviationListController
    on DtcCodeAbbreviationListControllerBase, Store {
  Computed<List<Abbreviation>> _$listFilteredComputed;

  @override
  List<Abbreviation> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Abbreviation>>(() => super.listFiltered,
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
abbreviations: ${abbreviations},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
