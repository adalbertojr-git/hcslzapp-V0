// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventListController on EventListControllerBase, Store {
  final _$titleCtrlAtom = Atom(name: 'EventListControllerBase.titleCtrl');

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

  final _$selectedEventsAtom =
      Atom(name: 'EventListControllerBase.selectedEvents');

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

  final _$eventsAtom = Atom(name: 'EventListControllerBase.events');

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

  final _$_eventRepoAtom = Atom(name: 'EventListControllerBase._eventRepo');

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

  final _$errorMsgAtom = Atom(name: 'EventListControllerBase.errorMsg');

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

  final _$EventListControllerBaseActionController =
      ActionController(name: 'EventListControllerBase');

  @override
  Future<dynamic> save(String title, String date) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.save');
    try {
      return super.save(title, date);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> update(Event event) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.update');
    try {
      return super.update(event);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> deleteById(Event event) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.deleteById');
    try {
      return super.deleteById(event);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEventTitle(String value) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.setEventTitle');
    try {
      return super.setEventTitle(value);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSelectedEvent(int i) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.removeSelectedEvent');
    try {
      return super.removeSelectedEvent(i);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addEvent(Event event, DateTime selectedDay) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.addEvent');
    try {
      return super.addEvent(event, selectedDay);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editEvent(int i) {
    final _$actionInfo = _$EventListControllerBaseActionController.startAction(
        name: 'EventListControllerBase.editEvent');
    try {
      return super.editEvent(i);
    } finally {
      _$EventListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleCtrl: ${titleCtrl},
selectedEvents: ${selectedEvents},
events: ${events},
errorMsg: ${errorMsg}
    ''';
  }
}
