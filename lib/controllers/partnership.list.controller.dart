import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/partnership.repo.dart';
import 'package:http/http.dart';
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
  Future<List<Partnership>> findAll() => _partnershipRepo.findAll();

  Future<List<Partnership>> getFuture() => future = findAll();

  @action
  Future<Response> deleteById(Partnership partnership) =>
      _partnershipRepo.deleteById(partnership);

  Future<void> deletePhoto(String photoUrl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.refFromURL(photoUrl);
    await reference.delete();
  }

  get getActivePartnerships => activePartnerships.addAll(
      partnerships.where((element) => element.status.contains('Ativo')));
}
