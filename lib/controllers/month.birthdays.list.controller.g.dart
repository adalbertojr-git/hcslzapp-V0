// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month.birthdays.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MonthBirthdaysListController
    on MonthBirthdaysListControllerBase, Store {
  late final _$isHidedButtonAtom = Atom(
      name: 'MonthBirthdaysListControllerBase.isHidedButton', context: context);

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

  late final _$associatedsAtom = Atom(
      name: 'MonthBirthdaysListControllerBase.associateds', context: context);

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

  late final _$_associatedRepoAtom = Atom(
      name: 'MonthBirthdaysListControllerBase._associatedRepo',
      context: context);

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
      Atom(name: 'MonthBirthdaysListControllerBase.future', context: context);

  @override
  Future<List<MonthBirthdays>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<MonthBirthdays>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$MonthBirthdaysListControllerBaseActionController =
      ActionController(
          name: 'MonthBirthdaysListControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo =
        _$MonthBirthdaysListControllerBaseActionController.startAction(
            name: 'MonthBirthdaysListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$MonthBirthdaysListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  Future<List<MonthBirthdays>> findBirthdays() {
    final _$actionInfo = _$MonthBirthdaysListControllerBaseActionController
        .startAction(name: 'MonthBirthdaysListControllerBase.findBirthdays');
    try {
      return super.findBirthdays();
    } finally {
      _$MonthBirthdaysListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidedButton: ${isHidedButton},
associateds: ${associateds},
future: ${future}
    ''';
  }
}
