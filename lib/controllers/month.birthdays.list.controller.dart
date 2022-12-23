import 'dart:async';
import 'package:hcslzapp/models/month.birthdays.dart';
import '../repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'month.birthdays.list.controller.g.dart';

class MonthBirthdaysListController = MonthBirthdaysListControllerBase
    with _$MonthBirthdaysListController;

abstract class MonthBirthdaysListControllerBase with Store {
  @observable
  bool isHidedButton = true;

  @observable
  ObservableList associateds = [].asObservable();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  Future<List<MonthBirthdays>> future = Future<List<MonthBirthdays>>.value([]);

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<MonthBirthdays>> findBirthdays() =>
      ObservableFuture(_associatedRepo.findBirthdays().then((value) => value));

  Future<List<MonthBirthdays>> getFuture() => future = findBirthdays();
}
