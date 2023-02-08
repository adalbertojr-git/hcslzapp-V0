// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boutique.associated.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoutiqueAssociatedController
    on BoutiqueAssociatedControllerBase, Store {
  Computed<List<Product>>? _$listFilteredComputed;

  @override
  List<Product> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Product>>(() => super.listFiltered,
              name: 'BoutiqueAssociatedControllerBase.listFiltered'))
      .value;

  late final _$isHidedButtonAtom = Atom(
      name: 'BoutiqueAssociatedControllerBase.isHidedButton', context: context);

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

  late final _$categoriesAtom = Atom(
      name: 'BoutiqueAssociatedControllerBase.categories', context: context);

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
      Atom(name: 'BoutiqueAssociatedControllerBase.products', context: context);

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

  late final _$firebaseRepoAtom = Atom(
      name: 'BoutiqueAssociatedControllerBase.firebaseRepo', context: context);

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
      Atom(name: 'BoutiqueAssociatedControllerBase.future', context: context);

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

  late final _$selectedIndexAtom = Atom(
      name: 'BoutiqueAssociatedControllerBase.selectedIndex', context: context);

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
      Atom(name: 'BoutiqueAssociatedControllerBase.filter', context: context);

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
      AsyncAction('BoutiqueAssociatedControllerBase.findAll', context: context);

  @override
  Future<List<Product>> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  late final _$BoutiqueAssociatedControllerBaseActionController =
      ActionController(
          name: 'BoutiqueAssociatedControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo =
        _$BoutiqueAssociatedControllerBaseActionController.startAction(
            name: 'BoutiqueAssociatedControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$BoutiqueAssociatedControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedIndex(int index) {
    final _$actionInfo = _$BoutiqueAssociatedControllerBaseActionController
        .startAction(name: 'BoutiqueAssociatedControllerBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$BoutiqueAssociatedControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<String> getCategories() {
    final _$actionInfo = _$BoutiqueAssociatedControllerBaseActionController
        .startAction(name: 'BoutiqueAssociatedControllerBase.getCategories');
    try {
      return super.getCategories();
    } finally {
      _$BoutiqueAssociatedControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$BoutiqueAssociatedControllerBaseActionController
        .startAction(name: 'BoutiqueAssociatedControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$BoutiqueAssociatedControllerBaseActionController
          .endAction(_$actionInfo);
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
