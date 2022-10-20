// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartnershipListController on PartnershipListControllerBase, Store {
  final _$isHidedButtonAtom =
      Atom(name: 'PartnershipListControllerBase.isHidedButton');

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

  final _$partnershipAtom =
      Atom(name: 'PartnershipListControllerBase.partnership');

  @override
  Partnership get partnership {
    _$partnershipAtom.reportRead();
    return super.partnership;
  }

  @override
  set partnership(Partnership value) {
    _$partnershipAtom.reportWrite(value, super.partnership, () {
      super.partnership = value;
    });
  }

  final _$partnershipsAtom =
      Atom(name: 'PartnershipListControllerBase.partnerships');

  @override
  ObservableList<dynamic> get partnerships {
    _$partnershipsAtom.reportRead();
    return super.partnerships;
  }

  @override
  set partnerships(ObservableList<dynamic> value) {
    _$partnershipsAtom.reportWrite(value, super.partnerships, () {
      super.partnerships = value;
    });
  }

  final _$activePartnershipsAtom =
      Atom(name: 'PartnershipListControllerBase.activePartnerships');

  @override
  ObservableList<dynamic> get activePartnerships {
    _$activePartnershipsAtom.reportRead();
    return super.activePartnerships;
  }

  @override
  set activePartnerships(ObservableList<dynamic> value) {
    _$activePartnershipsAtom.reportWrite(value, super.activePartnerships, () {
      super.activePartnerships = value;
    });
  }

  final _$_partnershipRepoAtom =
      Atom(name: 'PartnershipListControllerBase._partnershipRepo');

  @override
  PartnershipRepo get _partnershipRepo {
    _$_partnershipRepoAtom.reportRead();
    return super._partnershipRepo;
  }

  @override
  set _partnershipRepo(PartnershipRepo value) {
    _$_partnershipRepoAtom.reportWrite(value, super._partnershipRepo, () {
      super._partnershipRepo = value;
    });
  }

  final _$futureAtom = Atom(name: 'PartnershipListControllerBase.future');

  @override
  Future<List<Partnership>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<Partnership>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$errorMsgAtom = Atom(name: 'PartnershipListControllerBase.errorMsg');

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

  final _$pageControllerAtom =
      Atom(name: 'PartnershipListControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$currentPageAtom =
      Atom(name: 'PartnershipListControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$pageAtom = Atom(name: 'PartnershipListControllerBase.page');

  @override
  double get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(double value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$filterAtom = Atom(name: 'PartnershipListControllerBase.filter');

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

  final _$PartnershipListControllerBaseActionController =
      ActionController(name: 'PartnershipListControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$PartnershipListControllerBaseActionController
        .startAction(name: 'PartnershipListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$PartnershipListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic notificationListener() {
    final _$actionInfo =
        _$PartnershipListControllerBaseActionController.startAction(
            name: 'PartnershipListControllerBase.notificationListener');
    try {
      return super.notificationListener();
    } finally {
      _$PartnershipListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPageChanged(int pos) {
    final _$actionInfo = _$PartnershipListControllerBaseActionController
        .startAction(name: 'PartnershipListControllerBase.onPageChanged');
    try {
      return super.onPageChanged(pos);
    } finally {
      _$PartnershipListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Partnership>> findAll() {
    final _$actionInfo = _$PartnershipListControllerBaseActionController
        .startAction(name: 'PartnershipListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$PartnershipListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> deleteById(Partnership partnership) {
    final _$actionInfo = _$PartnershipListControllerBaseActionController
        .startAction(name: 'PartnershipListControllerBase.deleteById');
    try {
      return super.deleteById(partnership);
    } finally {
      _$PartnershipListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHidedButton: ${isHidedButton},
partnership: ${partnership},
partnerships: ${partnerships},
activePartnerships: ${activePartnerships},
future: ${future},
errorMsg: ${errorMsg},
pageController: ${pageController},
currentPage: ${currentPage},
page: ${page},
filter: ${filter}
    ''';
  }
}
