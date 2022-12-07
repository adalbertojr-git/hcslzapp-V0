import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/repositories/event.repo.dart';
import 'package:mobx/mobx.dart';

part 'event.calendar.controller.g.dart';

class EventCalendarController = EventCalendarControllerBase
    with _$EventCalendarController;

abstract class EventCalendarControllerBase with Store {
  @observable
  var titleCtrl = TextEditingController();

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  late String errorMsg;

  @observable
  late Future<String> future;

  @observable
  var events = LinkedHashMap<DateTime, List<Event>>();

  @observable
  List selectedEvents = List.filled(0, 0, growable: true);

  init() {
    events.clear();
    selectedEvents.clear();
    findAll().then((value) {
      events = _convertJsonToDateMap(value);
      print(events);
      selectedEvents = events[DateTime.now()] ?? [];
    });
  }

  @action
  Future<String> findAll() =>
      _eventRepo.findAll().then((value) => value).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future save(String title, String date) => ObservableFuture(_eventRepo
          .save(_setValues(0, title, date))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future update(Event event) => ObservableFuture(_eventRepo
          .update(_setValues(event.id, event.title, event.date))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future deleteById(Event event) => ObservableFuture(_eventRepo
          .deleteById(_setValues(event.id, event.title, event.date))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Event _setValues(int id, String title, String date) {
    return Event(id: id, date: date, title: title);
  }

  @action
  setSelectedEvents(List e) => selectedEvents = e;

  LinkedHashMap<DateTime, List<Event>> _convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    var ev = LinkedHashMap<DateTime, List<Event>>();
    for (var event in json) {
      var date = _parseDate(event['date']);
      ev.putIfAbsent(date, () => <Event>[]);
      var e =
          Event(id: event['id'], date: event['date'], title: event['title']);
      ev[date]?.add(e);
    }
    return ev;
  }

  DateTime _parseDate(String date) {
    List<int?> parts = date.split('-').map(int.tryParse).toList();
    int y = parts[0] ?? 0;
    int m = parts[1] ?? 0;
    int d = parts[2] ?? 0;
    return DateTime(y, m, d, 12, 0, 0, 0, 0);
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
