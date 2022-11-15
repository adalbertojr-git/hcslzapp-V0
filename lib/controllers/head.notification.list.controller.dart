import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/head.notification.repo.dart';
import '../../models/associated.dart';
import '../repositories/associated.repo.dart';
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
  String errorMsg = '';

  @observable
  Future<List<HeadNotification>> future =
      Future<List<HeadNotification>>.value([]);

  @observable
  String filter = '';

  init() {
    headNotifications.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<HeadNotification>> findAll() =>
      ObservableFuture(_headNotificationRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<List<HeadNotification>> getFuture() => future = findAll();

  @action
  Future deleteById(HeadNotification headNotification) =>
      ObservableFuture(_headNotificationRepo
          .deleteById(_setValues(
            headNotification.id,
            headNotification.title,
            headNotification.notification,
          ))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  HeadNotification _setValues(int id, String title, String notification) {
    return HeadNotification(
      id: id,
      title: title,
      notification: notification,
      datePublication: '',
    );
  }

  @action
  setFilter(String value) => filter = value;

  @computed
  List<HeadNotification> get listFiltered {
    if (filter.isEmpty) {
      return List<HeadNotification>.from(headNotifications);
    } else {
      return List<HeadNotification>.from(
          headNotifications.where((element) => element.title.contains(filter)));
    }
  }
}
