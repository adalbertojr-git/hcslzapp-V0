import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dependent.controller.g.dart';

class DependentController = DependentControllerBase
    with _$DependentController;

abstract class DependentControllerBase with Store {
  @observable
  var idCtrl = TextEditingController();

  @observable
  var nameCtrl = TextEditingController();

  @observable
  var phoneCtrl = TextEditingController();

  @observable
  var emailCtrl = TextEditingController();

  @observable
  var associatedTypeCtrl = TextEditingController();

  @observable
  var cpfCtrl = TextEditingController();

  @observable
  var bloodTypeCtrl = TextEditingController();

  @observable
  var dateBirthCtrl = TextEditingController();

  @observable
  var isAssociatedCtrl = TextEditingController();

  @observable
  bool isAssociated = false;

  /*
  vars nao observaveis
  */
  String currentBloodType;

  /*
  *
  actions ----------------------------------------------------------------------
  *
  */
  @action
  associated() => isAssociated = !isAssociated;

  /*
  *
  metodos nao observaveis-------------------------------------------------------
  *
  */
  changedDropDownItem(String selected) {
    currentBloodType = selected;
  }

}
