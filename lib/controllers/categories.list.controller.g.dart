// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesListController on CategoriesListControllerBase, Store {
  Computed<List<Category>>? _$listFilteredComputed;

  @override
  List<Category> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Category>>(() => super.listFiltered,
              name: 'CategoriesListControllerBase.listFiltered'))
      .value;

  late final _$titleCtrlAtom =
      Atom(name: 'CategoriesListControllerBase.titleCtrl', context: context);

  @override
  TextEditingController get titleCtrl {
    _$titleCtrlAtom.reportRead();
    return super.titleCtrl;
  }

  @override
  set titleCtrl(TextEditingController value) {
    _$titleCtrlAtom.reportWrite(value, super.titleCtrl, () {
      super.titleCtrl = value;
    });
  }

  late final _$isHidedButtonAtom = Atom(
      name: 'CategoriesListControllerBase.isHidedButton', context: context);

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

  late final _$categoriesAtom =
      Atom(name: 'CategoriesListControllerBase.categories', context: context);

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$firebaseRepoAtom =
      Atom(name: 'CategoriesListControllerBase.firebaseRepo', context: context);

  @override
  ProductFirebaseRepo get firebaseRepo {
    _$firebaseRepoAtom.reportRead();
    return super.firebaseRepo;
  }

  @override
  set firebaseRepo(ProductFirebaseRepo value) {
    _$firebaseRepoAtom.reportWrite(value, super.firebaseRepo, () {
      super.firebaseRepo = value;
    });
  }

  late final _$futureAtom =
      Atom(name: 'CategoriesListControllerBase.future', context: context);

  @override
  Future<List<Category>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<Category>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$filterAtom =
      Atom(name: 'CategoriesListControllerBase.filter', context: context);

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

  late final _$findAllAsyncAction =
      AsyncAction('CategoriesListControllerBase.findAll', context: context);

  @override
  Future<List<Category>> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  late final _$CategoriesListControllerBaseActionController =
      ActionController(name: 'CategoriesListControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$CategoriesListControllerBaseActionController
        .startAction(name: 'CategoriesListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$CategoriesListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$CategoriesListControllerBaseActionController
        .startAction(name: 'CategoriesListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$CategoriesListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleCtrl: ${titleCtrl},
isHidedButton: ${isHidedButton},
categories: ${categories},
firebaseRepo: ${firebaseRepo},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
