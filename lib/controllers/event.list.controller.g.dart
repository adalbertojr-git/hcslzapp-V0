// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventListController on EventListControllerBase, Store {
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

  @override
  String toString() {
    return '''
selectedEvents: ${selectedEvents}
    ''';
  }
}
