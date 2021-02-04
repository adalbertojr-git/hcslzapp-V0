import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:glutton/glutton.dart';

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
  bool isHidedButton = true;

  @observable
  ObservableList dependents = [].asObservable();

  @observable
  ObservableList motorcycles = [].asObservable();

  @observable
  String filePath;

  @observable
  Associated associated;

  @observable
  AssociatedRepo _associatedRepo = AssociatedRepo();

  @observable
  String errorMsg;

  @observable
  Future<List<Associated>> future;

  @observable
  String currentBloodType;

  @observable
  String currentAssociatedType;

  get init {
    _initLists;
    _initTextFields;
    currentBloodType = associated.bloodType;
    currentAssociatedType = associated.associatedType;
    formController = FormController(
      name: associated.name,
      email: associated.email,
    );
    getPhoto().then((value) => this.filePath = value);
  }

  Future<String> getPhoto() async {
    return await Glutton.vomit("photoPath");
  }

  get _initLists {
    dependents.clear();
    motorcycles.clear();
    dependents.addAll(associated.dependents);
    motorcycles.addAll(associated.motorcycles);
  }

  get _initTextFields {
    nameCtrl.text = associated.name;
    emailCtrl.text = associated.email;
    phoneCtrl.text = associated.phone;
    sponsorCtrl.text = associated.sponsor;
    cnhCtrl.text = associated.cnh;
    cpfCtrl.text = associated.cpf;
    associatedTypeCtrl.text = associated.associatedType;
    dateBirthCtrl.text = associated.dateBirth;
    dateShieldCtrl.text = associated.dateShield;
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  bool get hasErrors => hasErrorName || hasErrorEmail;

  bool get hasErrorName => validateName() != null;

  bool get hasErrorEmail => validateEmail() != null;

  @action
  Future findByIdToList(int id) => ObservableFuture(
              _associatedRepo.findByIdToList(id).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future update(Associated associated) => ObservableFuture(
              _associatedRepo.update(_setValues()).then((value) => value))
          .catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Associated>> getFuture(int _associatedId) =>
      future = findByIdToList(_associatedId);

  Associated _setValues() {
    this.associated.name = nameCtrl.text;
    this.associated.phone = phoneCtrl.text;
    this.associated.email = emailCtrl.text;
    this.associated.sponsor = sponsorCtrl.text;
    this.associated.associatedType = associatedTypeCtrl.text;
    this.associated.cnh = cnhCtrl.text;
    this.associated.cpf = cpfCtrl.text;
    this.associated.bloodType = currentBloodType;
    this.associated.associatedType = currentAssociatedType;
    this.associated.dateBirth = dateBirthCtrl.text;
    this.associated.dateShield = dateShieldCtrl.text;
    this.associated.dependents = List<Dependent>.from(dependents);
    this.associated.motorcycles = List<Motorcycle>.from(motorcycles);
    _savePhoto();
    return this.associated;
  }

  String validateName() {
    if (formController.name.isEmpty) {
      return "Nome é obrigatório!!!";
    }
    return null;
  }

  String validateEmail() {
    if (formController.email.isEmpty) {
      return "Email é obrigatório!!!";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(formController.email)) {
      return "Informe um email válido!!!";
    }
    return null;
  }

  String changedBloodTypesDropDownItem(selected) => currentBloodType = selected;

  String changedAssociatedTypesDropDownItem(selected) =>
      currentAssociatedType = selected;

  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      File _image = File(pickedFile.path);
      getFilePath(_image.path.toString());
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      File _image = File(pickedFile.path);
      getFilePath(_image.path.toString());
    }
  }

  Future _savePhoto() async {
    await Glutton.eat("photoPath", this.filePath);
  }

  @action
  String getFilePath(String value) => this.filePath = value;
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
