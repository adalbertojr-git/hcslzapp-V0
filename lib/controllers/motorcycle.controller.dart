import 'package:flutter/material.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:mobx/mobx.dart';

part 'motorcycle.controller.g.dart';

class MotorcycleController = MotorcycleControllerBase
    with _$MotorcycleController;

abstract class MotorcycleControllerBase with Store {
  @observable
  var idCtrl = TextEditingController();

  @observable
  var modelCtrl = TextEditingController();

  @observable
  var yearCtrl = TextEditingController();

  @observable
  var colorCtrl = TextEditingController();

  @observable
  var licencePlateCtrl = TextEditingController();

  @observable
  var nicknameCtrl = TextEditingController();

  @observable
  var chassisCtrl = TextEditingController();

  @observable
  var renavamCtrl = TextEditingController();

  add(BuildContext context) {
    idCtrl.text = "0";
    final int id = int.parse(idCtrl.text);
    final String model = modelCtrl.text;
    final String year = yearCtrl.text;
    final String color = colorCtrl.text;
    final String licencePlate = licencePlateCtrl.text;
    final String nickname = nicknameCtrl.text;
    final String chassis = chassisCtrl.text;
    final String renavam = renavamCtrl.text;
    if (model != '') {
      final motorcycle = Motorcycle(
          id, model, year, color, licencePlate, nickname, chassis, renavam);
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, motorcycle);
    }
  }

}
