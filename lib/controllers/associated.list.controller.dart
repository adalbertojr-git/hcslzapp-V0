import 'dart:async';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'associated.list.controller.g.dart';

class AssociatedListController = AssociatedListControllerBase
    with _$AssociatedListController;

abstract class AssociatedListControllerBase with Store {
  @observable
  bool isHideButton = true;

  @observable
  ObservableList associateds = [].asObservable();

  @observable
  Associated associated;

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Associated>> future;

  get init {
    _initLists;
  }

  get _initLists {
    associateds.clear();
  }

  @action
  bool hideButton() => isHideButton = !isHideButton;

  @action
  Future findAll() =>
      ObservableFuture(_associatedRepo.findAll().then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Associated>> getFuture() => future = findAll();
}
