import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/head.notification.repo.dart';
import 'package:mobx/mobx.dart';

part 'head.notification.add.controller.g.dart';

class HeadNotificationAddController = HeadNotificationAddControllerBase
    with _$HeadNotificationAddController;

abstract class HeadNotificationAddControllerBase with Store {
  var formController;

  @observable
  late TextEditingController idCtrl = TextEditingController();

  @observable
  late TextEditingController titleCtrl = TextEditingController();

  @observable
  late TextEditingController notificationCtrl = TextEditingController();

  @observable
  HeadNotification headNotification = Template().loadHeadNotification();

  @observable
  HeadNotificationRepo _headNotificationRepo = HeadNotificationRepo();

  @observable
  String errorMsg = '';

  init() {
    _initTextFields();
    formController = FormController(
        title: headNotification.title,
        notification: headNotification.notification);
  }

  _initTextFields() {
    titleCtrl.text = headNotification.title;
    notificationCtrl.text = headNotification.notification;
  }

  @action
  Future save() async => await _headNotificationRepo
          .save(await _setValues())
          .then((value) => value)
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future update() async =>
      await _headNotificationRepo.update(await _setValues()).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<HeadNotification> _setValues() async {
    return HeadNotification(
      id: headNotification.id,
      title: titleCtrl.text,
      notification: notificationCtrl.text,
      datePublication: '',
    );
  }

  bool get hasErrors => hasErrorTitle || hasErrorNotification;

  bool get hasErrorTitle => validateTitle() != null;

  bool get hasErrorNotification => validateNotification() != null;

  String? validateTitle() {
    const String _labelTitleRequired = 'Título é obrigatório!!!';

    if (formController.title.isEmpty) {
      return _labelTitleRequired;
    }
    return null;
  }

  String? validateNotification() {
    const String _labelNotificationRequired =
        'Descrição do aviso é obrigatória!!!';

    if (formController.notification.isEmpty) {
      return _labelNotificationRequired;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? title,
    String? notification,
  }) {
    super.title = title;
    super.notification = notification;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? title;

  @observable
  String? notification;

  @action
  changeTitle(String value) => title = value;

  @action
  changeNotification(String value) => notification = value;
}
