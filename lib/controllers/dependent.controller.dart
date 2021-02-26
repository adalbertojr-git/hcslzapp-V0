import 'package:flutter/material.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:mobx/mobx.dart';

part 'dependent.controller.g.dart';

class DependentController = DependentControllerBase with _$DependentController;

abstract class DependentControllerBase with Store {
  var formController;

  @observable
  var idCtrl = TextEditingController();

  @observable
  var nameCtrl = TextEditingController();

  @observable
  var phoneCtrl = TextEditingController();

  @observable
  var emailCtrl = TextEditingController();

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

  @observable
  String currentBloodType;

  @observable
  Dependent dependent;

  @action
  setAssociated() => isAssociated = !isAssociated;

  get init {
    _initTextFields;
    currentBloodType =
        dependent != null ? dependent.bloodType : getBloodTypes().first.value;
    isAssociated = (dependent != null
        ? (dependent.isAssociated == 'S' ? true : false)
        : false);
    formController = FormController(
      name: dependent != null ? dependent.name : '',
      email: dependent != null ? dependent.email : '',
    );
  }

  get _initTextFields {
    nameCtrl.text = dependent != null ? dependent.name : null;
    emailCtrl.text = dependent != null ? dependent.email : null;
    phoneCtrl.text = dependent != null ? dependent.phone : null;
    cpfCtrl.text = dependent != null ? dependent.cpf : null;
    dateBirthCtrl.text = dependent != null ? dependent.dateBirth : null;
  }

  String changedDropDownItem(selected) => currentBloodType = selected;

  add(BuildContext context) {
    idCtrl.text = "0";
    final int id = int.parse(idCtrl.text);
    final String name = nameCtrl.text;
    final String email = emailCtrl.text;
    final String phone = phoneCtrl.text;
    final String cpf = cpfCtrl.text;
    final String bloodType = currentBloodType;
    final String dateBirth = dateBirthCtrl.text;
    if (name != '') {
      final dependent = Dependent(
        id,
        name,
        email,
        phone,
        cpf,
        bloodType,
        dateBirth,
        (isAssociated ? 'S' : 'N'),
      );
      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, dependent);
    }
  }

  String validateName() {
    if (formController.name.isEmpty) {
      return "Nome é obrigatório!!!";
    }
    return null;
  }

  String validateEmail() {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return "Informe um email válido!!!";
    }
    return null;
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String name, String email}) {
    super.name = name;
    super.email = email;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String name;

  @observable
  String email;

  @action
  changeName(String value) => name = value;

  @action
  changeEmail(String value) => email = value;
}
