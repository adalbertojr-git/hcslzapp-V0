// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'head.notification.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeadNotificationListController
    on HeadNotificationListControllerBase, Store {
  Computed<List<HeadNotification>>? _$listFilteredComputed;

  @override
  List<HeadNotification> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<HeadNotification>>(() => super.listFiltered,
              name: 'HeadNotificationListControllerBase.listFiltered'))
      .value;

  final _$titleCtrlAtom =
      Atom(name: 'HeadNotificationListControllerBase.titleCtrl');

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

  final _$isHidedButtonAtom =
      Atom(name: 'HeadNotificationListControllerBase.isHidedButton');

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

  final _$headNotificationsAtom =
      Atom(name: 'HeadNotificationListControllerBase.headNotifications');

  @override
  ObservableList<dynamic> get headNotifications {
    _$headNotificationsAtom.reportRead();
    return super.headNotifications;
  }

  @override
  set headNotifications(ObservableList<dynamic> value) {
    _$headNotificationsAtom.reportWrite(value, super.headNotifications, () {
      super.headNotifications = value;
    });
  }

  final _$headNotificationAtom =
      Atom(name: 'HeadNotificationListControllerBase.headNotification');

  @override
  HeadNotification get headNotification {
    _$headNotificationAtom.reportRead();
    return super.headNotification;
  }

  @override
  set headNotification(HeadNotification value) {
    _$headNotificationAtom.reportWrite(value, super.headNotification, () {
      super.headNotification = value;
    });
  }

  final _$_headNotificationRepoAtom =
      Atom(name: 'HeadNotificationListControllerBase._headNotificationRepo');

  @override
  HeadNotificationRepo get _headNotificationRepo {
    _$_headNotificationRepoAtom.reportRead();
    return super._headNotificationRepo;
  }

  @override
  set _headNotificationRepo(HeadNotificationRepo value) {
    _$_headNotificationRepoAtom.reportWrite(value, super._headNotificationRepo,
        () {
      super._headNotificationRepo = value;
    });
  }

  final _$errorMsgAtom =
      Atom(name: 'HeadNotificationListControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'HeadNotificationListControllerBase.future');

  @override
  Future<List<HeadNotification>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<HeadNotification>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$filterAtom = Atom(name: 'HeadNotificationListControllerBase.filter');

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

  final _$HeadNotificationListControllerBaseActionController =
      ActionController(name: 'HeadNotificationListControllerBase');

  @override
  bool setButtonVisibilty() {
    final _$actionInfo =
        _$HeadNotificationListControllerBaseActionController.startAction(
            name: 'HeadNotificationListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$HeadNotificationListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  Future<List<HeadNotification>> findAll() {
    final _$actionInfo = _$HeadNotificationListControllerBaseActionController
        .startAction(name: 'HeadNotificationListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$HeadNotificationListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$HeadNotificationListControllerBaseActionController
        .startAction(name: 'HeadNotificationListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$HeadNotificationListControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleCtrl: ${titleCtrl},
isHidedButton: ${isHidedButton},
headNotifications: ${headNotifications},
headNotification: ${headNotification},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
