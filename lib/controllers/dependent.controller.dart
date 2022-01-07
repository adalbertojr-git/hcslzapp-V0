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
  TextEditingController? nameCtrl = TextEditingController();

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
  late String? currentBloodType;

  @observable
  late Dependent dependent;

  @action
  setAssociated() => isAssociated = !isAssociated;

  init() {
    _initTextFields();
/*    currentBloodType = (dependent != null
        ? dependent.bloodType
        : getBloodTypes().first.value)!;*/

    //String a = b ?? 'hello';
    //This means a equals b, but if b is null then a equals 'hello'.
    currentBloodType = dependent?.bloodType ?? getBloodTypes().first.value;

/*    isAssociated = (dependent != null
        ? (dependent.isAssociated == 'S' ? true : false)
        : false);*/
    isAssociated = (dependent.isAssociated == 'S' ? true : false);

    formController = FormController(
      name: dependent.name ?? '',
      email: dependent.email ?? '',
    );
  }

  _initTextFields() {
    nameCtrl?.text = dependent.name;
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
}

class FormController extends FormControllerBase with _$FormController {
  FormController({required String name, required String email}) {
    super.name = name;
    super.email = email;
  }
}

abstract class FormControllerBase with Store {
  @observable
  late String name;

  @observable
  late String email;

  @action
  changeName(String value) => name = value;

  @action
  changeEmail(String value) => email = value;
}
