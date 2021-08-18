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
  String filter = '';

  @observable
  Map<DateTime, List> events = {};

  @observable
  List selectedEvents = List();

  @observable
  AnimationController animController;

  @observable
  CalendarController calController;

  get init {
    findAll().then((value) {
      events = _convertJsonToDateMap(value);
      selectedEvents = events[DateTime.now()] ?? [];
    });
    titleCtrl.text = '';
  }

  @action
  Future<String> findAll() =>
      _eventRepo.findAll().then((value) => value).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future save(String title, String date) =>
      ObservableFuture(_eventRepo.save(_setValues(0, title, date)).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future deleteById(Event event) =>
      ObservableFuture(_eventRepo.deleteById(_setValues(event.id, event.title, event.date)).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Event _setValues(int id, String title, String date) {
    return Event(
        id: id,
        date: date, //calController.selectedDay.toString().substring(0, 10),
        title: title); //titleCtrl.text);
  }

  @action
  setSelectedEvents(List events) => selectedEvents = events;

  @action
  removeSelectedEvent(int i) => selectedEvents.removeAt(i);

  Map<DateTime, List> _convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    Map<DateTime, List<Event>> events = {};
    for (var event in json) {
      var date = _parseDate(event['date']);
      events.putIfAbsent(date, () => <Event>[]);
      var e = Event(
        id: event['id'],
        date: event['date'],
        title: event['title']      );
      events[date].add(e);
    }
    return events;
  }

  DateTime _parseDate(String date) {
    var parts = date.split('-').map(int.tryParse).toList();
    return DateTime(parts[0], parts[1], parts[2], 12, 0, 0, 0, 0);
  }

  setTitle(String value) => titleCtrl.text = value;

  addEvent() {
    if (titleCtrl.text.isEmpty) return;
    if (selectedEvents.isNotEmpty) {
      selectedEvents.add(titleCtrl.text);
      events[calController.selectedDay] = selectedEvents;
    } else {
      events[calController.selectedDay] = [titleCtrl.text].toList();
    }
    titleCtrl.clear();
  }

/*  editEvent(int i) {
    if (titleCtrl.text.isEmpty) return;
    selectedEvents[i] = titleCtrl.text;
    titleCtrl.clear();
  }*/

}
