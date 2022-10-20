import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/partnership.repo.dart';
import 'package:mobx/mobx.dart';

part 'partnership.list.controller.g.dart';

class PartnershipListController = PartnershipListControllerBase
    with _$PartnershipListController;

abstract class PartnershipListControllerBase with Store {

  @observable
  bool isHidedButton = true;

  @observable
  Partnership partnership = Template().loadPartnership();

  @observable
  ObservableList partnerships = [].asObservable();

  @observable
  ObservableList activePartnerships = [].asObservable();

  @observable
  PartnershipRepo _partnershipRepo = PartnershipRepo();

  @observable
  Future<List<Partnership>> future = Future<List<Partnership>>.value([]);

  @observable
  String errorMsg = "";

  @observable
  PageController pageController = PageController();

  @observable
  int currentPage = 0;

  @observable
  double page = 0.0;

  @observable
  String filter = '';

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  notificationListener() => page = pageController.page!;

  @action
  onPageChanged(int pos) => currentPage = pos;

  init() {
    partnerships.clear();
    activePartnerships.clear();
  }

  @action
  Future<List<Partnership>> findAll() =>
      ObservableFuture(_partnershipRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Partnership>> getFuture() => future = findAll();

  @action
  Future deleteById(Partnership partnership) =>
      ObservableFuture(_partnershipRepo.deleteById(partnership).then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  get getActivePartnerships => activePartnerships.addAll(
      partnerships.where((element) => element.status.contains('Ativo')));
}
