import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/motorcycle.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';

part 'associated.controller.g.dart';

class AssociatedController = AssociatedControllerBase
    with _$AssociatedController;

abstract class AssociatedControllerBase with Store {
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
  bool isHideButton = true;

  @observable
  ObservableFuture<List<Associated>> associatedListFuture;

  @observable
  ObservableFuture<Associated> associatedUpdate;

  @observable
  ObservableList dependents = [].asObservable();

  @observable
  ObservableList motorcycles = [].asObservable();

  Associated associated;

  final AssociatedRepo _associatedRepo = AssociatedRepo();

  String errorMsg;

  Future<List<Associated>> future;

  File _image;

  final picker = ImagePicker();

  String currentBloodType;

  get init {
    _initLists;
    _initTextFields;
    currentBloodType = associated.bloodType;
    formController = FormController(
      name: associated.name,
      email: associated.email,
    );
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
  bool hideButton() => isHideButton = !isHideButton;

  bool get hasErrors => hasErrorName || hasErrorEmail;

  bool get hasErrorName => validateName() != null;

  bool get hasErrorEmail => validateEmail() != null;

  @action
  Future fetchAssociated(int id) =>
      associatedListFuture = ObservableFuture(_associatedRepo
          .findByIdAssociatedToList(id)
          .then((value) => value)).catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future update(Associated associated) =>
      associatedUpdate = ObservableFuture(_associatedRepo
          .update(_setValues())
          .then((value) => value)).catchError((e) {
        this.errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Associated>> getFuture(int _associatedId) =>
      future = fetchAssociated(_associatedId);

  Associated _setValues() {
    this.associated.name = nameCtrl.text;
    this.associated.phone = phoneCtrl.text;
    this.associated.email = emailCtrl.text;
    this.associated.sponsor = sponsorCtrl.text;
    this.associated.associatedType = associatedTypeCtrl.text;
    this.associated.cnh = cnhCtrl.text;
    this.associated.cpf = cpfCtrl.text;
    this.associated.bloodType = currentBloodType;
    this.associated.dateBirth = dateBirthCtrl.text;
    this.associated.dateShield = dateShieldCtrl.text;
    this.associated.dependents = List<Dependent>.from(dependents);
    this.associated.motorcycles = List<Motorcycle>.from(motorcycles);
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

  String changedDropDownItem(selected) => currentBloodType = selected;

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
/*    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {
          //photo(_image.path.toString());
        });
      } else {
        print('No image selected.');
      }
    });*/
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
/*    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });*/
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
