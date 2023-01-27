import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/repositories/event.repo.dart';
import 'package:mobx/mobx.dart';

part 'event.calendar.controller.g.dart';

class EventCalendarController = EventCalendarControllerBase
    with _$EventCalendarController;

abstract class EventCalendarControllerBase with Store {
  @observable
  EventRepo _eventRepo = EventRepo();

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
  Future<String> findAll() => _eventRepo.findAll();

  Future<String> getFuture() => future = findAll();

  @action
  Future deleteById(Event event) => _eventRepo.deleteById(event);

  Future<void> deletePhoto(Event event) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.refFromURL(event.photoUrl);
    await reference.delete();
  }

  LinkedHashMap<DateTime, List<Event>> convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    var ev = LinkedHashMap<DateTime, List<Event>>();
    for (var event in json) {
      var date = _parseDate(event['date']);
      ev.putIfAbsent(date, () => <Event>[]);
      var e = Event(
        id: event['id'],
        initialDate: event['initialDate'],
        endDate: event['endDate'],
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

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }
}
