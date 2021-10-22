import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/repositories/event.repo.dart';
import 'package:mobx/mobx.dart';
import 'package:hcslzapp/models/event.dart';

part 'event.list.controller.g.dart';

class EventListController = EventListControllerBase with _$EventListController;

abstract class EventListControllerBase with Store {
  @observable
  var titleCtrl = TextEditingController();

  @observable
  List selectedEvents = List();

  @observable
  Map<DateTime, List> events = {};

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  String errorMsg;

  init() {
    selectedEvents.clear();
  }

  @action
  Future save(String title, String date) => ObservableFuture(_eventRepo
          .save(_setValues(0, title, date))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future update(Event event) => ObservableFuture(_eventRepo
          .update(_setValues(event.id, event.title, event.date))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future deleteById(Event event) => ObservableFuture(_eventRepo
          .deleteById(_setValues(event.id, event.title, event.date))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Event _setValues(int id, String title, String date) {
    return Event(id: id, date: date, title: title);
  }

  @action
  setEventTitle(String value) => titleCtrl.text = value;

  @action
  removeSelectedEvent(int i) => selectedEvents.removeAt(i);

  @action
  addEvent(Event event, DateTime selectedDay) {
    if (titleCtrl.text.isEmpty) return;
    events[selectedDay] = selectedEvents;
    selectedEvents.add(event);
    titleCtrl.clear();
  }

  @action
  editEvent(int i) {
    if (titleCtrl.text.isEmpty) return;
    selectedEvents[i] = titleCtrl.text;
    titleCtrl.clear();
  }
}
