// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'head.notification.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HeadNotificationAddController
    on HeadNotificationAddControllerBase, Store {
  late final _$idCtrlAtom =
      Atom(name: 'HeadNotificationAddControllerBase.idCtrl', context: context);

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

  late final _$titleCtrlAtom = Atom(
      name: 'HeadNotificationAddControllerBase.titleCtrl', context: context);

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

  late final _$notificationCtrlAtom = Atom(
      name: 'HeadNotificationAddControllerBase.notificationCtrl',
      context: context);

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

  late final _$headNotificationAtom = Atom(
      name: 'HeadNotificationAddControllerBase.headNotification',
      context: context);

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

  late final _$_headNotificationRepoAtom = Atom(
      name: 'HeadNotificationAddControllerBase._headNotificationRepo',
      context: context);

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

  late final _$photoUrlAtom = Atom(
      name: 'HeadNotificationAddControllerBase.photoUrl', context: context);

  @override
  String get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  late final _$photoPathAtom = Atom(
      name: 'HeadNotificationAddControllerBase.photoPath', context: context);

  @override
  String get photoPath {
    _$photoPathAtom.reportRead();
    return super.photoPath;
  }

  @override
  set photoPath(String value) {
    _$photoPathAtom.reportWrite(value, super.photoPath, () {
      super.photoPath = value;
    });
  }

  late final _$photoAtom =
      Atom(name: 'HeadNotificationAddControllerBase.photo', context: context);

  @override
  File get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(File value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  late final _$changedPhotoAtom = Atom(
      name: 'HeadNotificationAddControllerBase.changedPhoto', context: context);

  @override
  bool get changedPhoto {
    _$changedPhotoAtom.reportRead();
    return super.changedPhoto;
  }

  @override
  set changedPhoto(bool value) {
    _$changedPhotoAtom.reportWrite(value, super.changedPhoto, () {
      super.changedPhoto = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('HeadNotificationAddControllerBase.save', context: context);

  @override
  Future<HeadNotification> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$updateAsyncAction =
      AsyncAction('HeadNotificationAddControllerBase.update', context: context);

  @override
  Future<HeadNotification> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$getImageFromCameraAsyncAction = AsyncAction(
      'HeadNotificationAddControllerBase.getImageFromCamera',
      context: context);

  @override
  Future<dynamic> getImageFromCamera() {
    return _$getImageFromCameraAsyncAction
        .run(() => super.getImageFromCamera());
  }

  late final _$getImageFromGalleryAsyncAction = AsyncAction(
      'HeadNotificationAddControllerBase.getImageFromGallery',
      context: context);

  @override
  Future<dynamic> getImageFromGallery() {
    return _$getImageFromGalleryAsyncAction
        .run(() => super.getImageFromGallery());
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
titleCtrl: ${titleCtrl},
notificationCtrl: ${notificationCtrl},
headNotification: ${headNotification},
photoUrl: ${photoUrl},
photoPath: ${photoPath},
photo: ${photo},
changedPhoto: ${changedPhoto}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  late final _$titleAtom =
      Atom(name: 'FormControllerBase.title', context: context);

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

  late final _$notificationAtom =
      Atom(name: 'FormControllerBase.notification', context: context);

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

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

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
