import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/repositories/event.repo.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'event.calendar.controller.g.dart';

class EventCalendarController = EventCalendarControllerBase
    with _$EventCalendarController;

abstract class EventCalendarControllerBase with Store {
  @observable
  var titleCtrl = TextEditingController();

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  String errorMsg;

  @observable
  Future<String> future;

  @observable
  Map<DateTime, List> events = {};

  @observable
  List selectedEvents = List();

  @observable
  AnimationController animController;

  @observable
  CalendarController calController;

  init() {
    events.clear();
    selectedEvents.clear();
    findAll().then((value) {
      events = _convertJsonToDateMap(value);
      selectedEvents = events[DateTime.now()] ?? [];
    });
  }

  @action
  Future<String> findAll() =>
      _eventRepo.findAll().then((value) => value).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

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
  setSelectedEvents(List e) => selectedEvents = e;

  Map<DateTime, List> _convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    Map<DateTime, List<Event>> ev = {};
    for (var event in json) {
      var date = _parseDate(event['date']);
      ev.putIfAbsent(date, () => <Event>[]);
      var e =
          Event(id: event['id'], date: event['date'], title: event['title']);
      ev[date].add(e);
    }
    return ev;
  }

  DateTime _parseDate(String date) {
    var parts = date.split('-').map(int.tryParse).toList();
    return DateTime(parts[0], parts[1], parts[2], 12, 0, 0, 0, 0);
  }

  @action
  editEvent(int i) {
    if (titleCtrl.text.isEmpty) return;
    selectedEvents[i] = titleCtrl.text;
    titleCtrl.clear();
  }

  @action
  removeSelectedEvent(int i) => selectedEvents.removeAt(i);

  @action
  setEventTitle(String value) => titleCtrl.text = value;
}
