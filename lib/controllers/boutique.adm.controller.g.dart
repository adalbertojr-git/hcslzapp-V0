// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boutique.adm.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoutiqueAdmController on BoutiqueAdmControllerBase, Store {
  Computed<List<Product>>? _$listFilteredComputed;

  @override
  List<Product> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Product>>(() => super.listFiltered,
              name: 'BoutiqueAdmControllerBase.listFiltered'))
      .value;

  late final _$nameCtrlAtom =
      Atom(name: 'BoutiqueAdmControllerBase.nameCtrl', context: context);

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
      Atom(name: 'BoutiqueAdmControllerBase.isHidedButton', context: context);

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

  late final _$productsAtom =
      Atom(name: 'BoutiqueAdmControllerBase.products', context: context);

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
      Atom(name: 'BoutiqueAdmControllerBase.firebaseRepo', context: context);

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
      Atom(name: 'BoutiqueAdmControllerBase.future', context: context);

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

  late final _$filterAtom =
      Atom(name: 'BoutiqueAdmControllerBase.filter', context: context);

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
      AsyncAction('BoutiqueAdmControllerBase.findAll', context: context);

  @override
  Future<List<Product>> findAll() {
    return _$findAllAsyncAction.run(() => super.findAll());
  }

  late final _$BoutiqueAdmControllerBaseActionController =
      ActionController(name: 'BoutiqueAdmControllerBase', context: context);

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$BoutiqueAdmControllerBaseActionController
        .startAction(name: 'BoutiqueAdmControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$BoutiqueAdmControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$BoutiqueAdmControllerBaseActionController
        .startAction(name: 'BoutiqueAdmControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$BoutiqueAdmControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
isHidedButton: ${isHidedButton},
products: ${products},
firebaseRepo: ${firebaseRepo},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
