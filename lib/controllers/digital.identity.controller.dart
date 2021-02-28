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
  var sponsorCtrl = TextEditingController();

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
    getPhotoFromDevice().then((value) => photoPath = value);
  }

  @action
  setPhoto(String value) => photoPath = value;

  Future<String> getPhotoFromDevice() async {
    return await Glutton.vomit("photoPath");
  }
}
