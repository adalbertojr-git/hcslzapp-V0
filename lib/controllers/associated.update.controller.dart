import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/template.dart';
import '../models/associated.dart';
import '../models/dependent.dart';
import '../models/motorcycle.dart';
import '../repositories/associated.repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';

part 'associated.update.controller.g.dart';

class AssociatedUpdateController = AssociatedUpdateControllerBase
    with _$AssociatedUpdateController;

abstract class AssociatedUpdateControllerBase with Store {
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
  var statusCtrl = TextEditingController();

  @observable
  ObservableList dependents = [].asObservable();

  @observable
  ObservableList motorcycles = [].asObservable();

  @observable
  String photoPath = "";

  @observable
  String photoUrl = "";

  @observable
  File photo = File('');

  @observable
  bool changedPhoto = false;

  @observable
  Associated associated = Template().loadAssociated();

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String currentBloodType = "";

  @observable
  String currentAssociatedType = "";

  @observable
  String currentStatus = "";

  init() {
    dependents.clear();
    motorcycles.clear();
    dependents.addAll(associated.dependents);
    motorcycles.addAll(associated.motorcycles);

    nameCtrl.text = associated.name;
    emailCtrl.text = associated.email;
    phoneCtrl.text = associated.phone;
    sponsorCtrl.text = associated.sponsor;
    cnhCtrl.text = associated.cnh;
    cpfCtrl.text = associated.cpf;
    associatedTypeCtrl.text = associated.associatedType;
    dateBirthCtrl.text = associated.dateBirth;
    dateShieldCtrl.text = associated.dateShield;
    statusCtrl.text = associated.status;
    currentBloodType = associated.bloodType;

    currentAssociatedType = associated.associatedType;
    currentStatus = associated.status;

    photoUrl = associated.photoUrl;

    formController = FormController(
      name: associated.name,
      email: associated.email,
      dateBirth: associated.dateBirth,
      dateShield: associated.dateShield,
    );
  }

  bool get hasErrors =>
      hasErrorName || hasErrorEmail || hasErrorDateBirth || hasErrorDateShield;

  bool get hasErrorName => validateName() != null;

  bool get hasErrorEmail => validateEmail() != null;

  bool get hasErrorDateBirth => validateDateBirth() != null;

  bool get hasErrorDateShield => validateDateShield() != null;

  @action
  Future<Associated> update(Associated associated) async =>
      _associatedRepo.update(
        await _setValues(),
      );

  Future<Associated> _setValues() async {
    associated.name = nameCtrl.text;
    associated.phone = phoneCtrl.text;
    associated.email = emailCtrl.text;
    associated.sponsor = sponsorCtrl.text;
    associated.associatedType = associatedTypeCtrl.text;
    associated.cnh = cnhCtrl.text;
    associated.cpf = cpfCtrl.text;
    associated.bloodType = currentBloodType;
    associated.associatedType = currentAssociatedType;
    associated.status = currentStatus;
    associated.dateBirth = dateBirthCtrl.text;
    associated.dateShield = dateShieldCtrl.text;
    associated.dependents = List<Dependent>.from(dependents);
    associated.motorcycles = List<Motorcycle>.from(motorcycles);
    if (photo.path != '') {
      //se houve alteração de foto
      await _uploadPhoto().then((value) => associated.photoUrl = value);
    }
    return associated;
  }

  String? validateName() {
    const String _labelNameRequired = 'Nome é obrigatório!!!';

    if (formController.name.isEmpty) {
      return _labelNameRequired;
    }
    return null;
  }

  String? validateDateBirth() {
    const String _labelDatelNotValid = 'Informe uma data válida!!!';

    if (!RegExp(r"^(?:(?:31(\/)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/)"
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

  String? validateDateShield() {
    const String _labelDatelNotValid = 'Informe uma data válida!!!';

    if (!RegExp(r"^(?:(?:31(\/)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/)"
            r"(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^"
            r"(?:29(\/)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|"
            r"[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^"
            r"(?:0?[1-9]|1\d|2[0-8])(\/)(?:(?:0?[1-9])|"
            r"(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
        .hasMatch(formController.dateShield)) {
      return _labelDatelNotValid;
    }
    return null;
  }

  String? validateEmail() {
    const String _labelEmailRequired = 'Email é obrigatório!!!';
    const String _labelEmailNotValid = 'Informe um email válido!!!';

    if (formController.email.isEmpty) {
      return _labelEmailRequired;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return _labelEmailNotValid;
    }
    return null;
  }

  String changedBloodTypesDropDownItem(selected) => currentBloodType = selected;

  String changedAssociatedTypesDropDownItem(selected) =>
      currentAssociatedType = selected;

  String changedStatusDropDownItem(selected) => currentStatus = selected;

  @action
  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      changedPhoto = true;
      photoPath = photo.path.toString();
    }
  }

  @action
  Future getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      changedPhoto = true;
      photoPath = photo.path.toString();
    }
  }

  Future<String> _uploadPhoto() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child(
          'profilePhotos/${associated.id}',
        );
    await reference.putFile(photo);
    return await reference.getDownloadURL().catchError((e) {
      //errorMsg = "${e.message}";
    });
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? name,
    String? email,
    String? dateBirth,
    String? dateShield,
  }) {
    super.name = name;
    super.email = email;
    super.dateBirth = dateBirth;
    super.dateShield = dateShield;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? dateBirth;

  @observable
  String? dateShield;

  @action
  changeName(String value) => name = value;

  @action
  changeEmail(String value) => email = value;

  @action
  changeDateBirth(String value) => dateBirth = value;

  @action
  changeDateShield(String value) => dateShield = value;
}
