import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'event.list.controller.g.dart';

class EventListController = EventListControllerBase
    with _$EventListController;

abstract class EventListControllerBase with Store {
  @observable
  List selectedEvents = List();

  init() {
    selectedEvents.clear();
  }

}
