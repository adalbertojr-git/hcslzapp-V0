import 'package:flutter/material.dart';
import 'package:hcslzapp/models/template.dart';
import '../enums/blood.types.dart';
import '../models/dependent.dart';
import 'package:mobx/mobx.dart';

part 'dependent.controller.g.dart';

class DependentController = DependentControllerBase with _$DependentController;

abstract class DependentControllerBase with Store {
  var formController;

  @observable
  late TextEditingController idCtrl = TextEditingController();

  @observable
  late TextEditingController? nameCtrl = TextEditingController();

  @observable
  late TextEditingController? phoneCtrl = TextEditingController();

  @observable
  late TextEditingController? emailCtrl = TextEditingController();

  @observable
  late TextEditingController? cpfCtrl = TextEditingController();

  @observable
  late TextEditingController? bloodTypeCtrl = TextEditingController();

  @observable
  late TextEditingController? dateBirthCtrl = TextEditingController();

  @observable
  late TextEditingController? isAssociatedCtrl = TextEditingController();

  @observable
  bool isAssociated = false;

  @observable
  String currentBloodType = '';

  @observable
  Dependent dependent = Template().loadDependent();

  @action
  setAssociated() => isAssociated = !isAssociated;

  init() {
    _initTextFields();
    //String a = b ?? 'hello';
    //This means a equals b, but if b is null then a equals 'hello'.
    currentBloodType = (dependent.bloodType.isEmpty
        ? getBloodTypes().first.value
        : dependent.bloodType)!;
    isAssociated = (dependent.isAssociated == 'S' ? true : false);
    formController = FormController(
      name: dependent.name,
      email: dependent.email,
      dateBirth: dependent.dateBirth,
    );
  }

  _initTextFields() {
    nameCtrl?.text = dependent.name;
    emailCtrl?.text = dependent.email;
    phoneCtrl?.text = dependent.phone;
    cpfCtrl?.text = dependent.cpf;
    dateBirthCtrl?.text = dependent.dateBirth;
  }

  String changedDropDownItem(selected) => currentBloodType = selected;

  add(BuildContext context) {
    idCtrl.text = "0";
    final int id = int.parse(idCtrl.text);
    final String name = nameCtrl!.text;
    final String email = emailCtrl!.text;
    final String phone = phoneCtrl!.text;
    final String cpf = cpfCtrl!.text;
    final String bloodType = currentBloodType;
    final String dateBirth = dateBirthCtrl!.text;
    if (name != '') {
      final dependent = Dependent(
          id: id,
          name: name,
          email: email,
          phone: phone,
          cpf: cpf,
          bloodType: bloodType,
          dateBirth: dateBirth,
          isAssociated: 'N');
          // isAssociated: (isAssociated ? 'S' : 'N'));

      /*
      pop = manda resposta para o push (then)
      remove a tela da pilha de navegação. Ou seja, o push() adiciona uma tela
      à pilha, e o pop() a remove.
      */
      Navigator.pop(context, dependent);
    }
  }

  String? validateName() {
    const String _labelNameRequired = 'Nome é obrigatório!!!';

    if (formController.name.isEmpty) {
      return _labelNameRequired;
    }
    return null;
  }

  String? validateEmail() {
    const String _labelEmailNotValid = 'Informe um email válido!!!';

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return _labelEmailNotValid;
    }
    return null;
  }

  String? validateDateBirth() {
    const String _labelDatelNotValid = 'Informe uma data válida!!!';

    if (!RegExp(
        r"^(?:(?:31(\/)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/)"
        r"(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^"
        r"(?:29(\/)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|"
        r"[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^"
        r"(?:0?[1-9]|1\d|2[0-8])(\/)(?:(?:0?[1-9])|"
        r"(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
        .hasMatch(formController.dateBirth)) {
      return _labelDatelNotValid;
    }
    return null;
  }

}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? name,
    String? email,
    String? dateBirth,
  }) {
    super.name = name;
    super.email = email;
    super.dateBirth = dateBirth;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? dateBirth;

  @action
  changeName(String value) => name = value;

  @action
  changeEmail(String value) => email = value;

  @action
  changeDateBirth(String value) => dateBirth = value;
}