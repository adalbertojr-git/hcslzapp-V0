// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'associated.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssociatedListController on AssociatedListControllerBase, Store {
  Computed<List<Associated>> _$listFilteredComputed;

  @override
  List<Associated> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Associated>>(() => super.listFiltered,
              name: 'AssociatedListControllerBase.listFiltered'))
      .value;

  final _$nameCtrlAtom = Atom(name: 'AssociatedListControllerBase.nameCtrl');

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

  final _$isHidedButtonAtom =
      Atom(name: 'AssociatedListControllerBase.isHidedButton');

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

  final _$associatedsAtom =
      Atom(name: 'AssociatedListControllerBase.associateds');

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

  final _$associatedAtom =
      Atom(name: 'AssociatedListControllerBase.associated');

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

  final _$_associatedRepoAtom =
      Atom(name: 'AssociatedListControllerBase._associatedRepo');

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

  final _$errorMsgAtom = Atom(name: 'AssociatedListControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'AssociatedListControllerBase.future');

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

  final _$filterAtom = Atom(name: 'AssociatedListControllerBase.filter');

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

  final _$AssociatedListControllerBaseActionController =
      ActionController(name: 'AssociatedListControllerBase');

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
  Future<dynamic> findAll() {
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
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
