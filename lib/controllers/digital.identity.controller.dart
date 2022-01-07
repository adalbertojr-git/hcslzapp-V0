import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/digital.identity.dart';
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
  late DigitalIdentity digitalIdentity;

  @observable
  DigitalIdentityRepo _digitalIdentityRepo = DigitalIdentityRepo();

  @observable
  //late Future<List<DigitalIdentity>> future;
  late Future future;

  @observable
  late String errorMsg;


  init() {
    nameCtrl.text = digitalIdentity.name;
    cnhCtrl.text = digitalIdentity.cnh;
    cpfCtrl.text = digitalIdentity.cpf;
    associatedTypeCtrl.text = digitalIdentity.associatedType;
    dateBirthCtrl.text = digitalIdentity.dateBirth;
    dateShieldCtrl.text = digitalIdentity.dateShield;
    bloodTypeCtrl.text = digitalIdentity.bloodType;
  }

  @action
  Future findAssociatedByIdToList(int id) => ObservableFuture(
      _digitalIdentityRepo.findAssociatedByIdToList(id).then((value) => value))
      .catchError((e) {
    errorMsg = "${e.message}";
  }, test: (e) => e is Exception);

  Future getFuture(int _associatedId) =>
      future = findAssociatedByIdToList(_associatedId);
}
