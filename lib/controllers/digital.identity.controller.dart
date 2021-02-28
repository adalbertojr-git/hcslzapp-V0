import 'package:flutter/cupertino.dart';
import 'package:glutton/glutton.dart';
import 'package:hcslzapp/models/associated.dart';
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
  Associated associated;

  @observable
  DigitalIdentityRepo _digitalIdentityRepo = DigitalIdentityRepo();

  @observable
  Future<List<Associated>> future;

  @observable
  bool isHidedButton = true;

  @observable
  String photoPath;

  @observable
  String errorMsg;

  get init {
    _initTextFields;
    getPhotoFromDevice().then((value) => photoPath = value);
  }

  get _initTextFields {
    nameCtrl.text = associated.name;
    cnhCtrl.text = associated.cnh;
    cpfCtrl.text = associated.cpf;
    associatedTypeCtrl.text = associated.associatedType;
    dateBirthCtrl.text = associated.dateBirth;
    dateShieldCtrl.text = associated.dateShield;
    bloodTypeCtrl.text = associated.bloodType;
  }

  @action
  Future findAssociatedByIdToList(int id) =>
      ObservableFuture(_digitalIdentityRepo
          .findAssociatedByIdToList(id)
          .then((value) => value)).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Associated>> getFuture(int _associatedId) =>
      future = findAssociatedByIdToList(_associatedId);

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  setPhoto(String value) => photoPath = value;

  Future<String> getPhotoFromDevice() async {
    return await Glutton.vomit("photoPath");
  }
}
