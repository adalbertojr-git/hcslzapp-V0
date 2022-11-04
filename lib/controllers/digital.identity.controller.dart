import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/digital.identity.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/digital.identity.repo.dart';
import 'package:mobx/mobx.dart';

part 'digital.identity.controller.g.dart';

class DigitalIdentityController = DigitalIdentityControllerBase
    with _$DigitalIdentityController;

abstract class DigitalIdentityControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  var associatedTypeCtrl = TextEditingController();

  @observable
  var cnhCtrl = TextEditingController();

  @observable
  var cpfCtrl = TextEditingController();

  @observable
  var dateBirthCtrl = TextEditingController();

  @observable
  var dateShieldCtrl = TextEditingController();

  @observable
  var bloodTypeCtrl = TextEditingController();

  @observable
  var dueDateCtrl = TextEditingController();

  @observable
  DigitalIdentity digitalIdentity = Template().loadDigitalIdentity();

  @observable
  DigitalIdentityRepo _digitalIdentityRepo = DigitalIdentityRepo();

  @observable
  Future<List<DigitalIdentity>> future =
      Future<List<DigitalIdentity>>.value([]);

  @observable
  late String errorMsg;

  init() {
    nameCtrl.text = digitalIdentity.name;
    cnhCtrl.text =
        digitalIdentity.cnh.length == 0 ? 'Não informado' : digitalIdentity.cnh;
    cpfCtrl.text =
        digitalIdentity.cpf.length == 0 ? 'Não informado' : digitalIdentity.cpf;
    associatedTypeCtrl.text = digitalIdentity.associatedType;
    dateBirthCtrl.text = digitalIdentity.dateBirth.length == 0
        ? 'Não informado'
        : digitalIdentity.dateBirth;
    dateShieldCtrl.text = digitalIdentity.dateShield.length == 0
        ? 'Não informado'
        : digitalIdentity.dateShield;
    bloodTypeCtrl.text = digitalIdentity.bloodType.length == 0
        ? 'Não informado'
        : digitalIdentity.bloodType;
  }

  @action
  Future<List<DigitalIdentity>> findAssociatedByIdToList(int id) =>
      ObservableFuture(_digitalIdentityRepo
          .findAssociatedByIdToList(id)
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is HttpException).catchError((e) {
        errorMsg = "$e";
      }, test: (e) => e is Exception);

  Future<List<DigitalIdentity>> getFuture(int _associatedId) =>
      future = findAssociatedByIdToList(_associatedId);
}
