// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on DashboardControllerBase, Store {
  final _$photoUrlAtom = Atom(name: 'DashboardControllerBase.photoUrl');

  @override
  String get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase');

  @override
  dynamic setPhotoUrl(String value) {
    final _$actionInfo = _$DashboardControllerBaseActionController.startAction(
        name: 'DashboardControllerBase.setPhotoUrl');
    try {
      return super.setPhotoUrl(value);
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
photoUrl: ${photoUrl}
    ''';
  }
}
