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
/*  @observable
  var titleCtrl = TextEditingController();*/

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  String errorMsg = '';

  @observable
  bool isHidedButton = true;

  @observable
  var events = LinkedHashMap<DateTime, List<Event>>();

  @observable
  ValueNotifier<List<Event>> selectedEvents = ValueNotifier<List<Event>>([]);

  @observable
  Future<String> future = Future<String>.value('');

  init() {
    events.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<String> findAll() =>
      ObservableFuture(_eventRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<String> getFuture() => future = findAll();

  @action
  Future save(String title, String date) =>
      ObservableFuture(_eventRepo
          .save(_setValues(
        0,
        title,
        date,
        '',
        '',
      ))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future update(Event event) =>
      ObservableFuture(_eventRepo
          .update(_setValues(
        event.id,
        event.title,
        event.date,
        '',
        '',
      ))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  @action
  Future deleteById(Event event) =>
      ObservableFuture(_eventRepo
          .deleteById(_setValues(
        event.id,
        event.title,
        event.date,
        '',
        '',
      ))
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Event _setValues(int id,
      String title,
      String date,
      String description,
      String photoUrl,) {
    return Event(
      id: id,
      date: date,
      title: title,
      description: description,
      photoUrl: photoUrl,
    );
  }

  LinkedHashMap<DateTime, List<Event>> convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    var ev = LinkedHashMap<DateTime, List<Event>>();
    for (var event in json) {
      var date = _parseDate(event['date']);
      ev.putIfAbsent(date, () => <Event>[]);
      var e = Event(
        id: event['id'],
        date: event['date'],
        title: event['title'],
        description: event['description'],
        photoUrl: event['photoUrl'],
      );
      ev[date]?.add(e);
    }
    return ev;
  }

  DateTime _parseDate(String date) {
    List<int?> parts = date.split('-').map(int.tryParse).toList();
    int y = parts[0] ?? 0;
    int m = parts[1] ?? 0;
    int d = parts[2] ?? 0;
    return DateTime.utc(y, m, d);
  }

/*
  @action
  editEvent(int i) {
    if (titleCtrl.text.isEmpty) return;
    selectedEvents[i] = titleCtrl.text;
    titleCtrl.clear();
  }
*/

/*  @action
  removeSelectedEvent(int i) => selectedEvents.removeAt(i);*/

/*  @action
  setEventTitle(String value) => titleCtrl.text = value;*/

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last
        .difference(first)
        .inDays + 1;
    return List.generate(
      dayCount,
          (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }
}
