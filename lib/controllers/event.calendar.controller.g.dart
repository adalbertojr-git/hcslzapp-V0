// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.calendar.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventCalendarController on EventCalendarControllerBase, Store {
  late final _$titleCtrlAtom =
      Atom(name: 'EventCalendarControllerBase.titleCtrl', context: context);

  @override
  TextEditingController get titleCtrl {
    _$titleCtrlAtom.reportRead();
    return super.titleCtrl;
  }

  @override
  set titleCtrl(TextEditingController value) {
    _$titleCtrlAtom.reportWrite(value, super.titleCtrl, () {
      super.titleCtrl = value;
    });
  }

  late final _$_eventRepoAtom =
      Atom(name: 'EventCalendarControllerBase._eventRepo', context: context);

  @override
  EventRepo get _eventRepo {
    _$_eventRepoAtom.reportRead();
    return super._eventRepo;
  }

  @override
  set _eventRepo(EventRepo value) {
    _$_eventRepoAtom.reportWrite(value, super._eventRepo, () {
      super._eventRepo = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: 'EventCalendarControllerBase.errorMsg', context: context);

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$futureAtom =
      Atom(name: 'EventCalendarControllerBase.future', context: context);

  @override
  Future<String> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<String> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$eventsAtom =
      Atom(name: 'EventCalendarControllerBase.events', context: context);

  @override
  LinkedHashMap<DateTime, List<Event>> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(LinkedHashMap<DateTime, List<Event>> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$selectedEventsAtom = Atom(
      name: 'EventCalendarControllerBase.selectedEvents', context: context);

  @override
  List<dynamic> get selectedEvents {
    _$selectedEventsAtom.reportRead();
    return super.selectedEvents;
  }

  @override
  set selectedEvents(List<dynamic> value) {
    _$selectedEventsAtom.reportWrite(value, super.selectedEvents, () {
      super.selectedEvents = value;
    });
  }

  late final _$EventCalendarControllerBaseActionController =
      ActionController(name: 'EventCalendarControllerBase', context: context);

  @override
  Future<String> findAll() {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> save(String title, String date) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.save');
    try {
      return super.save(title, date);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> update(Event event) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.update');
    try {
      return super.update(event);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> deleteById(Event event) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.deleteById');
    try {
      return super.deleteById(event);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedEvents(List<dynamic> e) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.setSelectedEvents');
    try {
      return super.setSelectedEvents(e);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editEvent(int i) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.editEvent');
    try {
      return super.editEvent(i);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSelectedEvent(int i) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.removeSelectedEvent');
    try {
      return super.removeSelectedEvent(i);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEventTitle(String value) {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.setEventTitle');
    try {
      return super.setEventTitle(value);
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleCtrl: ${titleCtrl},
errorMsg: ${errorMsg},
future: ${future},
events: ${events},
selectedEvents: ${selectedEvents}
    ''';
  }
}
