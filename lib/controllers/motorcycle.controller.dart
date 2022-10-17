import 'package:flutter/material.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:mobx/mobx.dart';

part 'motorcycle.controller.g.dart';

class MotorcycleController = MotorcycleControllerBase
    with _$MotorcycleController;

abstract class MotorcycleControllerBase with Store {
  var formController;

  @observable
  late TextEditingController idCtrl = TextEditingController();

  @observable
  late TextEditingController? modelCtrl = TextEditingController();

  @observable
  late TextEditingController? yearCtrl = TextEditingController();

  @observable
  late TextEditingController? colorCtrl = TextEditingController();

  @observable
  late TextEditingController? licencePlateCtrl = TextEditingController();

  @observable
  late TextEditingController? nicknameCtrl = TextEditingController();

  @observable
  late TextEditingController? chassisCtrl = TextEditingController();

  @observable
  late TextEditingController? renavamCtrl = TextEditingController();

  @observable
  Motorcycle motorcycle = Template().loadMotorcycle();

  init() {
    _initTextFields();
    formController = FormController(
      model: motorcycle.model,
    );
  }

  _initTextFields() {
    modelCtrl?.text = motorcycle.model;
    yearCtrl?.text = motorcycle.year;
    colorCtrl?.text = motorcycle.color;
    licencePlateCtrl?.text = motorcycle.licencePlate;
    nicknameCtrl?.text = motorcycle.nickname;
    chassisCtrl?.text = motorcycle.chassis;
    renavamCtrl?.text = motorcycle.renavam;
  }

  add(BuildContext context) {
    idCtrl.text = "0";
    final int id = int.parse(idCtrl.text);
    final String model = modelCtrl!.text;
    final String year = yearCtrl!.text;
    final String color = colorCtrl!.text;
    final String licencePlate = licencePlateCtrl!.text;
    final String nickname = nicknameCtrl!.text;
    final String chassis = chassisCtrl!.text;
    final String renavam = renavamCtrl!.text;
    if (model != '') {
      final motorcycle = Motorcycle(
        id: id,
        model: model,
        year: year,
        color: color,
        licencePlate: licencePlate,
        nickname: nickname,
        chassis: chassis,
        renavam: renavam,
      );
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, motorcycle);
    }
  }

  String? validateModel() {
    const String _labelModelRequired = 'Modelo é obrigatório!!!';

    if (formController.model.isEmpty) {
      return _labelModelRequired;
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? model,
  }) {
    super.model = model;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? model;

  @action
  changeModel(String value) => model = value;
}
