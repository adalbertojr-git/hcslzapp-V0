// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.add.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductAddController on ProductAddControllerBase, Store {
  late final _$idCtrlAtom =
      Atom(name: 'ProductAddControllerBase.idCtrl', context: context);

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

  late final _$nameCtrlAtom =
      Atom(name: 'ProductAddControllerBase.nameCtrl', context: context);

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

  late final _$descriptionCtrlAtom =
      Atom(name: 'ProductAddControllerBase.descriptionCtrl', context: context);

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

  late final _$categoryCtrlAtom =
      Atom(name: 'ProductAddControllerBase.categoryCtrl', context: context);

  @override
  TextEditingController get categoryCtrl {
    _$categoryCtrlAtom.reportRead();
    return super.categoryCtrl;
  }

  @override
  set categoryCtrl(TextEditingController value) {
    _$categoryCtrlAtom.reportWrite(value, super.categoryCtrl, () {
      super.categoryCtrl = value;
    });
  }

  late final _$colorCtrlAtom =
      Atom(name: 'ProductAddControllerBase.colorCtrl', context: context);

  @override
  TextEditingController get colorCtrl {
    _$colorCtrlAtom.reportRead();
    return super.colorCtrl;
  }

  @override
  set colorCtrl(TextEditingController value) {
    _$colorCtrlAtom.reportWrite(value, super.colorCtrl, () {
      super.colorCtrl = value;
    });
  }

  late final _$photoUrlAtom =
      Atom(name: 'ProductAddControllerBase.photoUrl', context: context);

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
      Atom(name: 'ProductAddControllerBase.photoPath', context: context);

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
      Atom(name: 'ProductAddControllerBase.photo', context: context);

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
      Atom(name: 'ProductAddControllerBase.changedPhoto', context: context);

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
      Atom(name: 'ProductAddControllerBase.event', context: context);

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
      Atom(name: 'ProductAddControllerBase._eventRepo', context: context);

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

  late final _$selectedDateAtom =
      Atom(name: 'ProductAddControllerBase.selectedDate', context: context);

  @override
  String get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(String value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$pickedInitialDateAtom = Atom(
      name: 'ProductAddControllerBase.pickedInitialDate', context: context);

  @override
  String get pickedInitialDate {
    _$pickedInitialDateAtom.reportRead();
    return super.pickedInitialDate;
  }

  @override
  set pickedInitialDate(String value) {
    _$pickedInitialDateAtom.reportWrite(value, super.pickedInitialDate, () {
      super.pickedInitialDate = value;
    });
  }

  late final _$pickedEndDateAtom =
      Atom(name: 'ProductAddControllerBase.pickedEndDate', context: context);

  @override
  String get pickedEndDate {
    _$pickedEndDateAtom.reportRead();
    return super.pickedEndDate;
  }

  @override
  set pickedEndDate(String value) {
    _$pickedEndDateAtom.reportWrite(value, super.pickedEndDate, () {
      super.pickedEndDate = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('ProductAddControllerBase.save', context: context);

  @override
  Future<Event> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$updateAsyncAction =
      AsyncAction('ProductAddControllerBase.update', context: context);

  @override
  Future<Event> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$getImageFromCameraAsyncAction = AsyncAction(
      'ProductAddControllerBase.getImageFromCamera',
      context: context);

  @override
  Future<dynamic> getImageFromCamera() {
    return _$getImageFromCameraAsyncAction
        .run(() => super.getImageFromCamera());
  }

  late final _$getImageFromGalleryAsyncAction = AsyncAction(
      'ProductAddControllerBase.getImageFromGallery',
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
nameCtrl: ${nameCtrl},
descriptionCtrl: ${descriptionCtrl},
categoryCtrl: ${categoryCtrl},
colorCtrl: ${colorCtrl},
photoUrl: ${photoUrl},
photoPath: ${photoPath},
photo: ${photo},
changedPhoto: ${changedPhoto},
event: ${event},
selectedDate: ${selectedDate},
pickedInitialDate: ${pickedInitialDate},
pickedEndDate: ${pickedEndDate}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  late final _$nameAtom =
      Atom(name: 'FormControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
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
  dynamic changeName(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeName');
    try {
      return super.changeName(value);
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
name: ${name},
description: ${description}
    ''';
  }
}
