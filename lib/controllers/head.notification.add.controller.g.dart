// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'head.notification.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeadNotificationAddController
    on HeadNotificationAddControllerBase, Store {
  final _$idCtrlAtom = Atom(name: 'HeadNotificationAddControllerBase.idCtrl');

  @override
  TextEditingController get idCtrl {
    _$idCtrlAtom.reportRead();
    return super.idCtrl;
  }

  @override
  set idCtrl(TextEditingController value) {
    _$idCtrlAtom.reportWrite(value, super.idCtrl, () {
      super.idCtrl = value;
    });
  }

  final _$titleCtrlAtom =
      Atom(name: 'HeadNotificationAddControllerBase.titleCtrl');

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

  final _$notificationCtrlAtom =
      Atom(name: 'HeadNotificationAddControllerBase.notificationCtrl');

  @override
  TextEditingController get notificationCtrl {
    _$notificationCtrlAtom.reportRead();
    return super.notificationCtrl;
  }

  @override
  set notificationCtrl(TextEditingController value) {
    _$notificationCtrlAtom.reportWrite(value, super.notificationCtrl, () {
      super.notificationCtrl = value;
    });
  }

  final _$headNotificationAtom =
      Atom(name: 'HeadNotificationAddControllerBase.headNotification');

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
      Atom(name: 'HeadNotificationAddControllerBase._headNotificationRepo');

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
      Atom(name: 'HeadNotificationAddControllerBase.errorMsg');

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

  final _$saveAsyncAction =
      AsyncAction('HeadNotificationAddControllerBase.save');

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$updateAsyncAction =
      AsyncAction('HeadNotificationAddControllerBase.update');

  @override
  Future<dynamic> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
titleCtrl: ${titleCtrl},
notificationCtrl: ${notificationCtrl},
headNotification: ${headNotification},
errorMsg: ${errorMsg}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  final _$titleAtom = Atom(name: 'FormControllerBase.title');

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$notificationAtom = Atom(name: 'FormControllerBase.notification');

  @override
  String? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(String? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase');

  @override
  dynamic changeTitle(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeTitle');
    try {
      return super.changeTitle(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNotification(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeNotification');
    try {
      return super.changeNotification(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
notification: ${notification}
    ''';
  }
}
