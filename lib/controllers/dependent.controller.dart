import 'package:flutter/material.dart';
import 'package:hcslzapp/models/dependent.dart';
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

  String currentBloodType;

  @action
  associated() => isAssociated = !isAssociated;

  changedDropDownItem(String selected) {
    currentBloodType = selected;
  }

  add(BuildContext context) {
    idCtrl.text = "0";
    final int id = int.parse(idCtrl.text);
    final String name = nameCtrl.text;
    final String email = emailCtrl.text;
    final String phone = phoneCtrl.text;
    final String cpf = cpfCtrl.text;
    final String bloodType = currentBloodType;
    final String dateBirth = dateBirthCtrl.text;
    final String isAssociated = (this.isAssociated ? 'S' : 'N');
    if (name != '') {
      final dependent = Dependent(
          id, name, email, phone, cpf, bloodType, dateBirth, isAssociated);
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, dependent);
    }
  }

}
