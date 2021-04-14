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
  var eventCtrl = TextEditingController();

  @observable
  Event event;

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
  }

  @action
  Future<String> findAll() =>
      _eventRepo.findAll().then((value) => value).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  setSelectedEvents(List events) => selectedEvents = events;

  @action
  removeSelectedEvent(int i) => selectedEvents.removeAt(i);

  Map<DateTime, List> _convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    var jsonEmbedded = json['_embedded'];
    var jsonEvents = jsonEmbedded['event'];
    Map<DateTime, List<String>> events = {};
    for (var event in jsonEvents) {
      var date = _parseDate(event['date']);
      events.putIfAbsent(date, () => <String>[]);
      events[date].add(event['description']);
    }
    return events;
  }

  DateTime _parseDate(String date) {
    var parts = date.split('-').map(int.tryParse).toList();
    return DateTime(parts[0], parts[1], parts[2], 12, 0, 0, 0, 0);
  }

  setEventCtrl(String value) => eventCtrl.text = value;

  addEvent() {
    if (eventCtrl.text.isEmpty) return;
    if (selectedEvents.isNotEmpty) {
      selectedEvents.add(eventCtrl.text);
      events[calController.selectedDay] = selectedEvents;
    } else {
      events[calController.selectedDay] = [eventCtrl.text].toList();
    }
    eventCtrl.clear();
  }

  editEvent(int i) {
    if (eventCtrl.text.isEmpty) return;
    selectedEvents[i] = eventCtrl.text;
    eventCtrl.clear();
  }
}
