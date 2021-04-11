// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.calendar.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventCalendarController on EventCalendarControllerBase, Store {
  final _$nameCtrlAtom = Atom(name: 'EventCalendarControllerBase.nameCtrl');

  @override
  TextEditingController get nameCtrl {
    _$nameCtrlAtom.reportRead();
    return super.nameCtrl;
  }

  @override
  set nameCtrl(TextEditingController value) {
    _$nameCtrlAtom.reportWrite(value, super.nameCtrl, () {
      super.nameCtrl = value;
    });
  }

  final _$eventsAtom = Atom(name: 'EventCalendarControllerBase.events');

  @override
  ObservableList<dynamic> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableList<dynamic> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$eventAtom = Atom(name: 'EventCalendarControllerBase.event');

  @override
  Event get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(Event value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

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

  final _$filterAtom = Atom(name: 'EventCalendarControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$EventCalendarControllerBaseActionController =
      ActionController(name: 'EventCalendarControllerBase');

  @override
  Future<dynamic> findAll() {
    final _$actionInfo = _$EventCalendarControllerBaseActionController
        .startAction(name: 'EventCalendarControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$EventCalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
events: ${events},
event: ${event},
errorMsg: ${errorMsg},
future: ${future},
filter: ${filter}
    ''';
  }
}
