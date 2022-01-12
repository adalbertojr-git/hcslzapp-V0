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

  final _$associatedAtom = Atom(name: 'DashboardControllerBase.associated');

  @override
  Associated get associated {
    _$associatedAtom.reportRead();
    return super.associated;
  }

  @override
  set associated(Associated value) {
    _$associatedAtom.reportWrite(value, super.associated, () {
      super.associated = value;
    });
  }

  final _$selectedProfileAtom =
      Atom(name: 'DashboardControllerBase.selectedProfile');

  @override
  String get selectedProfile {
    _$selectedProfileAtom.reportRead();
    return super.selectedProfile;
  }

  @override
  set selectedProfile(String value) {
    _$selectedProfileAtom.reportWrite(value, super.selectedProfile, () {
      super.selectedProfile = value;
    });
  }

  final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase');

  @override
  dynamic setAssociated(Associated associated) {
    final _$actionInfo = _$DashboardControllerBaseActionController.startAction(
        name: 'DashboardControllerBase.setAssociated');
    try {
      return super.setAssociated(associated);
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic changeProfile() {
    final _$actionInfo = _$DashboardControllerBaseActionController.startAction(
        name: 'DashboardControllerBase.changeProfile');
    try {
      return super.changeProfile();
    } finally {
      _$DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
photoUrl: ${photoUrl},
associated: ${associated},
selectedProfile: ${selectedProfile}
    ''';
  }
}
