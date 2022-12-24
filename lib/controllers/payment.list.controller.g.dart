// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentListController on PaymentListControllerBase, Store {
  Computed<List<Associated>>? _$listFilteredComputed;

  @override
  List<Associated> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Associated>>(() => super.listFiltered,
              name: 'PaymentListControllerBase.listFiltered'))
      .value;

  late final _$nameCtrlAtom =
      Atom(name: 'PaymentListControllerBase.nameCtrl', context: context);

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

  late final _$isHidedButtonAtom =
      Atom(name: 'PaymentListControllerBase.isHidedButton', context: context);

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
      Atom(name: 'PaymentListControllerBase.associateds', context: context);

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

  late final _$_associatedRepoAtom =
      Atom(name: 'PaymentListControllerBase._associatedRepo', context: context);

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

  late final _$futureAtom =
      Atom(name: 'PaymentListControllerBase.future', context: context);

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
      Atom(name: 'PaymentListControllerBase.filter', context: context);

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

  late final _$PaymentListControllerBaseActionController =
      ActionController(name: 'PaymentListControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$PaymentListControllerBaseActionController
        .startAction(name: 'PaymentListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$PaymentListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Associated>> findAll() {
    final _$actionInfo = _$PaymentListControllerBaseActionController
        .startAction(name: 'PaymentListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$PaymentListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$PaymentListControllerBaseActionController
        .startAction(name: 'PaymentListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$PaymentListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
isHidedButton: ${isHidedButton},
associateds: ${associateds},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
