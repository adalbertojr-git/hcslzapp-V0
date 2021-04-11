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
  var nameCtrl = TextEditingController();

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
  AnimationController animationController;

  @observable
  CalendarController calendarController;

  @observable
  TextEditingController eventController;

  get init {
    getFuture().then((value) {
      events = convertJsonToDateMap(value);
      print(events);
      selectedEvents = events[DateTime.now()] ?? [];
    });
  }

  @action
  Future<String> findAll()  =>
      _eventRepo.findAll().then((value) => value)
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<String> getFuture() => future = findAll();

  @action
  setSelectedEvents(List events) => selectedEvents = events;

  Map<DateTime, List> convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    var jsonEmbedded = json['_embedded'];
    var jsonEvents = jsonEmbedded['event'];
    Map<DateTime, List<String>> events = {};
    for (var event in jsonEvents) {
      var date = parseDate(event['date']);
      events.putIfAbsent(date, () => <String>[]);
      events[date].add(event['description']);
    }
    return events;
  }

  DateTime parseDate(String date) {
    var parts = date.split('-').map(int.tryParse).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }

}
