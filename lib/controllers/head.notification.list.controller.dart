import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/head.notification.repo.dart';
import 'package:mobx/mobx.dart';

part 'head.notification.list.controller.g.dart';

class HeadNotificationListController = HeadNotificationListControllerBase
    with _$HeadNotificationListController;

abstract class HeadNotificationListControllerBase with Store {
  @observable
  var titleCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  ObservableList headNotifications = [].asObservable();

  @observable
  HeadNotification headNotification = Template().loadHeadNotification();

  @observable
  HeadNotificationRepo _headNotificationRepo = HeadNotificationRepo();

  @observable
  String photoPath = "";

  @observable
  String photoUrl = "";

  @observable
  Future<List<HeadNotification>> future =
      Future<List<HeadNotification>>.value([]);

  @observable
  String filter = '';

  init() {
    headNotifications.clear();
    photoUrl = headNotification.photoUrl;
    setButtonVisibilty();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<HeadNotification>> findAll() =>
      ObservableFuture(_headNotificationRepo.findAll().then((value) => value));

  Future<List<HeadNotification>> getFuture() => future = findAll();

  @action
  Future deleteById(HeadNotification headNotification) =>
      ObservableFuture(_headNotificationRepo
          .deleteById(headNotification)
          .then((value) => value));
}
