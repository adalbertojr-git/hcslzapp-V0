// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagementAddController on ManagementAddControllerBase, Store {
  late final _$nameCtrlAtom =
      Atom(name: 'ManagementAddControllerBase.nameCtrl', context: context);

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

  late final _$listItemsAtom =
      Atom(name: 'ManagementAddControllerBase.listItems', context: context);

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

  late final _$idsAtom =
      Atom(name: 'ManagementAddControllerBase.ids', context: context);

  @override
  ObservableList<int> get ids {
    _$idsAtom.reportRead();
    return super.ids;
  }

  @override
  set ids(ObservableList<int> value) {
    _$idsAtom.reportWrite(value, super.ids, () {
      super.ids = value;
    });
  }

  late final _$associatedsAtom =
      Atom(name: 'ManagementAddControllerBase.associateds', context: context);

  @override
  ObservableList<ItemModel> get associateds {
    _$associatedsAtom.reportRead();
    return super.associateds;
  }

  @override
  set associateds(ObservableList<ItemModel> value) {
    _$associatedsAtom.reportWrite(value, super.associateds, () {
      super.associateds = value;
    });
  }

  late final _$isHidedButtonAtom =
      Atom(name: 'ManagementAddControllerBase.isHidedButton', context: context);

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

  late final _$_associatedRepoAtom = Atom(
      name: 'ManagementAddControllerBase._associatedRepo', context: context);

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

  late final _$_managementRepoAtom = Atom(
      name: 'ManagementAddControllerBase._managementRepo', context: context);

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

  late final _$errorMsgAtom =
      Atom(name: 'ManagementAddControllerBase.errorMsg', context: context);

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

  late final _$futureAtom =
      Atom(name: 'ManagementAddControllerBase.future', context: context);

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

  late final _$filterAtom =
      Atom(name: 'ManagementAddControllerBase.filter', context: context);

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

  late final _$ManagementAddControllerBaseActionController =
      ActionController(name: 'ManagementAddControllerBase', context: context);

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
  Future<List<Associated>> findAllNotAdminToList() {
    final _$actionInfo = _$ManagementAddControllerBaseActionController
        .startAction(name: 'ManagementAddControllerBase.findAllNotAdminToList');
    try {
      return super.findAllNotAdminToList();
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
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
listItems: ${listItems},
ids: ${ids},
associateds: ${associateds},
isHidedButton: ${isHidedButton},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter}
    ''';
  }
}
