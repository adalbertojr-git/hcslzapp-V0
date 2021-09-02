import 'package:flutter/cupertino.dart';
import 'package:hcslzapp/models/associated.dart';
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
  Associated associated;

  init() {
    _initTextFields();
  }

  _initTextFields() {
    nameCtrl.text = associated.name;
    cnhCtrl.text = associated.cnh;
    cpfCtrl.text = associated.cpf;
    associatedTypeCtrl.text = associated.associatedType;
    dateBirthCtrl.text = associated.dateBirth;
    dateShieldCtrl.text = associated.dateShield;
    bloodTypeCtrl.text = associated.bloodType;
  }
}
