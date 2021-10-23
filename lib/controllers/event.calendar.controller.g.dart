// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.calendar.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventCalendarController on EventCalendarControllerBase, Store {
  final _$_eventRepoAtom = Atom(name: 'EventCalendarControllerBase._eventRepo');

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

  final _$errorMsgAtom = Atom(name: 'EventCalendarControllerBase.errorMsg');

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

  final _$futureAtom = Atom(name: 'EventCalendarControllerBase.future');

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

  final _$eventsAtom = Atom(name: 'EventCalendarControllerBase.events');

  @override
  Map<DateTime, List<dynamic>> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(Map<DateTime, List<dynamic>> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$selectedEventsAtom =
      Atom(name: 'EventCalendarControllerBase.selectedEvents');

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

  final _$animControllerAtom =
      Atom(name: 'EventCalendarControllerBase.animController');

  @override
  AnimationController get animController {
    _$animControllerAtom.reportRead();
    return super.animController;
  }

  @override
  set animController(AnimationController value) {
    _$animControllerAtom.reportWrite(value, super.animController, () {
      super.animController = value;
    });
  }

  final _$calControllerAtom =
      Atom(name: 'EventCalendarControllerBase.calController');

  @override
  CalendarController get calController {
    _$calControllerAtom.reportRead();
    return super.calController;
  }

  @override
  set calController(CalendarController value) {
    _$calControllerAtom.reportWrite(value, super.calController, () {
      super.calController = value;
    });
  }

  final _$EventCalendarControllerBaseActionController =
      ActionController(name: 'EventCalendarControllerBase');

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
  String toString() {
    return '''
errorMsg: ${errorMsg},
future: ${future},
events: ${events},
selectedEvents: ${selectedEvents},
animController: ${animController},
calController: ${calController}
    ''';
  }
}
