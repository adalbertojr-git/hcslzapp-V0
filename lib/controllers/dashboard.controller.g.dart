// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardController on DashboardControllerBase, Store {
  late final _$photoUrlAtom =
      Atom(name: 'DashboardControllerBase.photoUrl', context: context);

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

  late final _$associatedAtom =
      Atom(name: 'DashboardControllerBase.associated', context: context);

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

  late final _$selectedProfileAtom =
      Atom(name: 'DashboardControllerBase.selectedProfile', context: context);

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

  late final _$futureAtom =
      Atom(name: 'DashboardControllerBase.future', context: context);

  @override
  Future<List<Associated>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<Associated>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$_associatedRepoAtom =
      Atom(name: 'DashboardControllerBase._associatedRepo', context: context);

  @override
  AssociatedRepo get _associatedRepo {
    _$_associatedRepoAtom.reportRead();
    return super._associatedRepo;
  }

  @override
  set _associatedRepo(AssociatedRepo value) {
    _$_associatedRepoAtom.reportWrite(value, super._associatedRepo, () {
      super._associatedRepo = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: 'DashboardControllerBase.errorMsg', context: context);

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

  late final _$DashboardControllerBaseActionController =
      ActionController(name: 'DashboardControllerBase', context: context);

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
selectedProfile: ${selectedProfile},
future: ${future},
errorMsg: ${errorMsg}
    ''';
  }
}
