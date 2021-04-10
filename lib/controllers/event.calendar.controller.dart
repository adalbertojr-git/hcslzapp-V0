import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/repositories/event.repo.dart';
import 'package:mobx/mobx.dart';

part 'event.calendar.controller.g.dart';

class EventCalendarController = EventCalendarControllerBase
    with _$EventCalendarController;

abstract class EventCalendarControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  ObservableList events = [].asObservable();

  @observable
  Event event;

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Event>> future;

  @observable
  String filter = '';

  get init {
    events.clear();
  }

  @action
  Future findAll() =>
      ObservableFuture(_eventRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Event>> getFuture() => future = findAll();

}
