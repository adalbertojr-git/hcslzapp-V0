import 'package:flutter/material.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:mobx/mobx.dart';

part 'partnership.add.controller.g.dart';

class PartnershipAddController = PartnershipAddControllerBase
    with _$PartnershipAddController;

abstract class PartnershipAddControllerBase with Store {
  var formController;

  @observable
  var idCtrl = TextEditingController();

  @observable
  var partnerCtrl = TextEditingController();

  @observable
  var phone1Ctrl = TextEditingController();

  @observable
  var phone2Ctrl = TextEditingController();

  @observable
  var addressCtrl = TextEditingController();

  @observable
  var promotionCtrl = TextEditingController();

  @observable
  var statusCtrl = TextEditingController();

  @observable
  String photoUrl;

  @observable
  bool isActive = true;

  @observable
  String currentStatus;

  @observable
  Partnership partnership;

  @action
  setStatus() => isActive = !isActive;

  get init {
    _initTextFields;
    currentStatus = statusCtrl.text;
    formController = FormController(
      name: partnership != null ? partnership.partner : '',
    );
  }

  get _initTextFields {
    partnerCtrl.text = partnership != null ? partnership.partner : null;
    phone1Ctrl.text = partnership != null ? partnership.phone1 : null;
    phone2Ctrl.text = partnership != null ? partnership.phone2 : null;
    addressCtrl.text = partnership != null ? partnership.address : null;
    promotionCtrl.text = partnership != null ? partnership.promotion : null;
    statusCtrl.text = partnership != null ? partnership.status : null;
  }

  String changedStatusDropDownItem(selected) =>
      currentStatus = selected;

  String validateName() {
    if (formController.name.isEmpty) {
      return "Nome é obrigatório!!!";
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String name}) {
    super.name = name;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String name;

  @action
  changeName(String value) => name = value;
}
