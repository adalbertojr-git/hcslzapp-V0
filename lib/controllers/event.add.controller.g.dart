// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventAddController on EventAddControllerBase, Store {
  late final _$idCtrlAtom =
      Atom(name: 'EventAddControllerBase.idCtrl', context: context);

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

  late final _$titleCtrlAtom =
      Atom(name: 'EventAddControllerBase.titleCtrl', context: context);

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

  late final _$descriptionCtrlAtom =
      Atom(name: 'EventAddControllerBase.descriptionCtrl', context: context);

  @override
  TextEditingController get descriptionCtrl {
    _$descriptionCtrlAtom.reportRead();
    return super.descriptionCtrl;
  }

  @override
  set descriptionCtrl(TextEditingController value) {
    _$descriptionCtrlAtom.reportWrite(value, super.descriptionCtrl, () {
      super.descriptionCtrl = value;
    });
  }

  late final _$photoUrlAtom =
      Atom(name: 'EventAddControllerBase.photoUrl', context: context);

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

  late final _$photoPathAtom =
      Atom(name: 'EventAddControllerBase.photoPath', context: context);

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
      Atom(name: 'EventAddControllerBase.photo', context: context);

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

  late final _$changedPhotoAtom =
      Atom(name: 'EventAddControllerBase.changedPhoto', context: context);

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

  late final _$eventAtom =
      Atom(name: 'EventAddControllerBase.event', context: context);

  @override
  Event get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(Event value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  late final _$_eventRepoAtom =
      Atom(name: 'EventAddControllerBase._eventRepo', context: context);

  @override
  EventRepo get _eventRepo {
    _$_eventRepoAtom.reportRead();
    return super._eventRepo;
  }

  @override
  set _eventRepo(EventRepo value) {
    _$_eventRepoAtom.reportWrite(value, super._eventRepo, () {
      super._eventRepo = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: 'EventAddControllerBase.errorMsg', context: context);

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

  late final _$saveAsyncAction =
      AsyncAction('EventAddControllerBase.save', context: context);

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$updateAsyncAction =
      AsyncAction('EventAddControllerBase.update', context: context);

  @override
  Future<dynamic> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$getImageFromCameraAsyncAction = AsyncAction(
      'EventAddControllerBase.getImageFromCamera',
      context: context);

  @override
  Future<dynamic> getImageFromCamera() {
    return _$getImageFromCameraAsyncAction
        .run(() => super.getImageFromCamera());
  }

  late final _$getImageFromGalleryAsyncAction = AsyncAction(
      'EventAddControllerBase.getImageFromGallery',
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
descriptionCtrl: ${descriptionCtrl},
photoUrl: ${photoUrl},
photoPath: ${photoPath},
photo: ${photo},
changedPhoto: ${changedPhoto},
event: ${event},
errorMsg: ${errorMsg}
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

  late final _$descriptionAtom =
      Atom(name: 'FormControllerBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
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
  dynamic changeDescription(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description}
    ''';
  }
}
