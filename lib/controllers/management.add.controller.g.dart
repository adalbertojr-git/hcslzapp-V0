// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ManagementAddController on ManagementAddControllerBase, Store {
  Computed<List<ItemModel>> _$listFilteredComputed;

  @override
  List<ItemModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ItemModel>>(() => super.listFiltered,
              name: 'ManagementAddControllerBase.listFiltered'))
      .value;

  final _$nameCtrlAtom = Atom(name: 'ManagementAddControllerBase.nameCtrl');

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

  final _$listItemsAtom = Atom(name: 'ManagementAddControllerBase.listItems');

  @override
  ObservableList<ItemModel> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<ItemModel> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$associatedsAtom =
      Atom(name: 'ManagementAddControllerBase.associateds');

  @override
  ObservableList<int> get associateds {
    _$associatedsAtom.reportRead();
    return super.associateds;
  }

  @override
  set associateds(ObservableList<int> value) {
    _$associatedsAtom.reportWrite(value, super.associateds, () {
      super.associateds = value;
    });
  }

  final _$isHidedButtonAtom =
      Atom(name: 'ManagementAddControllerBase.isHidedButton');

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

  final _$_associatedRepoAtom =
      Atom(name: 'ManagementAddControllerBase._associatedRepo');

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

  final _$_managementRepoAtom =
      Atom(name: 'ManagementAddControllerBase._managementRepo');

  @override
  ManagementRepo get _managementRepo {
    _$_managementRepoAtom.reportRead();
    return super._managementRepo;
  }

  @override
  set _managementRepo(ManagementRepo value) {
    _$_managementRepoAtom.reportWrite(value, super._managementRepo, () {
      super._managementRepo = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'ManagementAddControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'ManagementAddControllerBase.future');

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

  final _$filterAtom = Atom(name: 'ManagementAddControllerBase.filter');

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

  final _$ManagementAddControllerBaseActionController =
      ActionController(name: 'ManagementAddControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$ManagementAddControllerBaseActionController
        .startAction(name: 'ManagementAddControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$ManagementAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$ManagementAddControllerBaseActionController
        .startAction(name: 'ManagementAddControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$ManagementAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> save() {
    final _$actionInfo = _$ManagementAddControllerBaseActionController
        .startAction(name: 'ManagementAddControllerBase.save');
    try {
      return super.save();
    } finally {
      _$ManagementAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$ManagementAddControllerBaseActionController
        .startAction(name: 'ManagementAddControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$ManagementAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
listItems: ${listItems},
associateds: ${associateds},
isHidedButton: ${isHidedButton},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
