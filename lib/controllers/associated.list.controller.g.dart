// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'associated.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssociatedListController on AssociatedListControllerBase, Store {
  Computed<List<Associated>>? _$listFilteredComputed;

  @override
  List<Associated> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Associated>>(() => super.listFiltered,
              name: 'AssociatedListControllerBase.listFiltered'))
      .value;

  late final _$nameCtrlAtom =
      Atom(name: 'AssociatedListControllerBase.nameCtrl', context: context);

  @override
  TextEditingController get nameCtrl {
    _$nameCtrlAtom.reportRead();
    return super.nameCtrl;
  }

  @override
  set nameCtrl(TextEditingController value) {
    _$nameCtrlAtom.reportWrite(value, super.nameCtrl, () {
      super.nameCtrl = value;
    });
  }

  late final _$isHidedButtonAtom = Atom(
      name: 'AssociatedListControllerBase.isHidedButton', context: context);

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

  late final _$associatedsAtom =
      Atom(name: 'AssociatedListControllerBase.associateds', context: context);

  @override
  ObservableList<dynamic> get associateds {
    _$associatedsAtom.reportRead();
    return super.associateds;
  }

  @override
  set associateds(ObservableList<dynamic> value) {
    _$associatedsAtom.reportWrite(value, super.associateds, () {
      super.associateds = value;
    });
  }

  late final _$associatedAtom =
      Atom(name: 'AssociatedListControllerBase.associated', context: context);

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

  late final _$_associatedRepoAtom = Atom(
      name: 'AssociatedListControllerBase._associatedRepo', context: context);

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

  late final _$filterAtom =
      Atom(name: 'AssociatedListControllerBase.filter', context: context);

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

  late final _$AssociatedListControllerBaseActionController =
      ActionController(name: 'AssociatedListControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$AssociatedListControllerBaseActionController
        .startAction(name: 'AssociatedListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$AssociatedListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Associated>> findAll() {
    final _$actionInfo = _$AssociatedListControllerBaseActionController
        .startAction(name: 'AssociatedListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$AssociatedListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$AssociatedListControllerBaseActionController
        .startAction(name: 'AssociatedListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$AssociatedListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
isHidedButton: ${isHidedButton},
associateds: ${associateds},
associated: ${associated},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
