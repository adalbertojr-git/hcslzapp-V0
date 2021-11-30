import 'package:flutter/material.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:mobx/mobx.dart';

part 'motorcycle.controller.g.dart';

class MotorcycleController = MotorcycleControllerBase
    with _$MotorcycleController;

abstract class MotorcycleControllerBase with Store {

  var formController;

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

  @observable
  Motorcycle motorcycle;

  init() {
    _initTextFields();
    formController = FormController(
      model: motorcycle != null ? motorcycle.model : '',
    );
  }

  _initTextFields() {
    modelCtrl.text = motorcycle != null ? motorcycle.model : null;
    yearCtrl.text = motorcycle != null ? motorcycle.year : null;
    colorCtrl.text = motorcycle != null ? motorcycle.color : null;
    licencePlateCtrl.text = motorcycle != null ? motorcycle.licencePlate : null;
    nicknameCtrl.text = motorcycle != null ? motorcycle.nickname : null;
    chassisCtrl.text = motorcycle != null ? motorcycle.chassis : null;
    renavamCtrl.text = motorcycle != null ? motorcycle.renavam : null;
  }

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

  String validateModel() {
    const String _labelModelRequired = 'Modelo é obrigatório!!!';

    if (formController.model.isEmpty) {
      return _labelModelRequired;
    }
    return null;
  }

}

class FormController extends FormControllerBase with _$FormController {
  FormController({String model}) {
    super.model = model;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String model;

  @action
  changeModel(String value) => model = value;

}
