// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boutique.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoutiqueController on BoutiqueControllerBase, Store {
  late final _$isHidedButtonAtom =
      Atom(name: 'BoutiqueControllerBase.isHidedButton', context: context);

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
      Atom(name: 'BoutiqueControllerBase.categories', context: context);

  @override
  ObservableList<dynamic> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<dynamic> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$firebaseRepoAtom =
      Atom(name: 'BoutiqueControllerBase.firebaseRepo', context: context);

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

  late final _$selectedIndexAtom =
      Atom(name: 'BoutiqueControllerBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$BoutiqueControllerBaseActionController =
      ActionController(name: 'BoutiqueControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<String>> getCategories() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.getCategories');
    try {
      return super.getCategories();
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Products>> getAll() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.getAll');
    try {
      return super.getAll();
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> getOne() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.getOne');
    try {
      return super.getOne();
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<String>> getProductsByCategory() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.getProductsByCategory');
    try {
      return super.getProductsByCategory();
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedIndex(int index) {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidedButton: ${isHidedButton},
categories: ${categories},
firebaseRepo: ${firebaseRepo},
selectedIndex: ${selectedIndex}
    ''';
  }
}
