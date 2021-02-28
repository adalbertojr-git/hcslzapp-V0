import 'package:flutter/cupertino.dart';
import 'package:glutton/glutton.dart';
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
  String photoPath;

  get init {
    _initTextFields;
    getPhotoFromDevice().then((value) => photoPath = value);
  }

  get _initTextFields {
    nameCtrl.text = 'Adalberto Jr';//associated.name;
    cnhCtrl.text = '777777';//associated.cnh;
    cpfCtrl.text = '8888888';//associated.cpf;
    associatedTypeCtrl.text = 'membro Fundador';//associated.associatedType;
    dateBirthCtrl.text =  '28/09/1976';//associated.dateBirth;
    dateShieldCtrl.text = '27/07/2019';//associated.dateShield;
  }

  @action
  setPhoto(String value) => photoPath = value;

  Future<String> getPhotoFromDevice() async {
    return await Glutton.vomit("photoPath");
  }
}
