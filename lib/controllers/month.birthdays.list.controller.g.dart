// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month.birthdays.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MonthBirthdaysListController
    on MonthBirthdaysListControllerBase, Store {
  final _$isHidedButtonAtom =
      Atom(name: 'MonthBirthdaysListControllerBase.isHidedButton');

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
      Atom(name: 'MonthBirthdaysListControllerBase.associateds');

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

  final _$_associatedRepoAtom =
      Atom(name: 'MonthBirthdaysListControllerBase._associatedRepo');

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

  final _$errorMsgAtom =
      Atom(name: 'MonthBirthdaysListControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'MonthBirthdaysListControllerBase.future');

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

  final _$MonthBirthdaysListControllerBaseActionController =
      ActionController(name: 'MonthBirthdaysListControllerBase');

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
errorMsg: ${errorMsg},
future: ${future}
    ''';
  }
}
