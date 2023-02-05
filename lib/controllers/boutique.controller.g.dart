// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boutique.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoutiqueController on BoutiqueControllerBase, Store {
  Computed<List<Product>>? _$listFilteredComputed;

  @override
  List<Product> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Product>>(() => super.listFiltered,
              name: 'BoutiqueControllerBase.listFiltered'))
      .value;

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
  List<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'BoutiqueControllerBase.products', context: context);

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
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

  late final _$futureAtom =
      Atom(name: 'BoutiqueControllerBase.future', context: context);

  @override
  Future<List<Product>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<Product>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
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

  late final _$filterAtom =
      Atom(name: 'BoutiqueControllerBase.filter', context: context);

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
  Future<List<Product>> getAll() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.getAll');
    try {
      return super.getAll();
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
  List<String> getCategories() {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.getCategories');
    try {
      return super.getCategories();
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$BoutiqueControllerBaseActionController.startAction(
        name: 'BoutiqueControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$BoutiqueControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidedButton: ${isHidedButton},
categories: ${categories},
products: ${products},
firebaseRepo: ${firebaseRepo},
future: ${future},
selectedIndex: ${selectedIndex},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
