import 'package:flutter/cupertino.dart';
import 'package:glutton/glutton.dart';
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
  DigitalIdentity digitalIdentity;

  @observable
  DigitalIdentityRepo _digitalIdentityRepo = DigitalIdentityRepo();

  @observable
  Future<List<DigitalIdentity>> future;

  @observable
  bool isHidedButton = true;

  @observable
  String photoPath;

  @observable
  String errorMsg;

  init() {
    _initTextFields();
    getPhotoFromDevice().then((value) => photoPath = value);
  }

  _initTextFields() {
    nameCtrl.text = digitalIdentity.name;
    cnhCtrl.text = digitalIdentity.cnh;
    cpfCtrl.text = digitalIdentity.cpf;
    associatedTypeCtrl.text = digitalIdentity.associatedType;
    dateBirthCtrl.text = digitalIdentity.dateBirth;
    dateShieldCtrl.text = digitalIdentity.dateShield;
    bloodTypeCtrl.text = digitalIdentity.bloodType;
    dueDateCtrl.text = digitalIdentity.dueDate;
  }

  @action
  Future findAssociatedByIdToList(int id) =>
      ObservableFuture(_digitalIdentityRepo
          .findAssociatedByIdToList(id)
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<DigitalIdentity>> getFuture(int _associatedId) =>
      future = findAssociatedByIdToList(_associatedId);

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  setPhoto(String value) => photoPath = value;

  Future<String> getPhotoFromDevice() async {
    return await Glutton.vomit("photoPath");
  }
}
