// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on DashboardControllerBase, Store {
  final _$photoPathAtom = Atom(name: 'DashboardControllerBase.photoPath');

  @override
  String get photoPath {
    _$photoPathAtom.reportRead();
    return super.photoPath;
  }

  @override
  set photoPath(String value) {
    _$photoPathAtom.reportWrite(value, super.photoPath, () {
      super.photoPath = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'DashboardControllerBase.errorMsg');

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

  final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase');

  @override
  dynamic setPhoto(String value) {
    final _$actionInfo = _$DashboardControllerBaseActionController.startAction(
        name: 'DashboardControllerBase.setPhoto');
    try {
      return super.setPhoto(value);
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
photoPath: ${photoPath},
errorMsg: ${errorMsg}
    ''';
  }
}
