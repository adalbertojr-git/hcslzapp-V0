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
    formController = FormController(name: associated.name);
  }

  get _initLists {
    dependents.clear();
    motorcycles.clear();
    dependents.addAll(associated.dependents);
    motorcycles.addAll(associated.motorcycles);
  }

  get _initTextFields {
    nameCtrl.text = associated.name;
  }

  @action
  bool hideButton() => isHideButton = !isHideButton;

  @action
  Future fetchAssociated(int id) =>
      associatedListFuture = ObservableFuture(_associatedRepo
          .findByIdAssociatedToList(id)
          .then((associated) => associated)).catchError((e) {
        this.errorMsg = "TimeOutException: ${e.toString()}";
      }, test: (e) => e is TimeoutException).catchError((e) {
        this.errorMsg = "Exception: ${e.toString()}";
      }, test: (e) => e is Exception);

  @action
  update(Associated associated) {
    print (hasErrors);
    if (!hasErrors) {

/*      associatedUpdate = ObservableFuture(_associatedRepo
          .update(_setFieldsToUpdate())
          .then((associated) => associated)).catchError((e) {
        this.errorMsg = "TimeOutException: ${e.toString()}";
      }, test: (e) => e is TimeoutException).catchError((e) {
        this.errorMsg = "Exception: ${e.toString()}";
      }, test: (e) => e is Exception);*/
    }
  }

  String validateName() {
    print('---------- validateName ----------');
    print(formController.name);
    if(formController.name.isEmpty) {
      return "Nome não pode ser nulo!!!";
    }
    return null;
  }

  Future<List<Associated>> getFuture(int _associatedId) =>
      future = fetchAssociated(_associatedId);

  bool get hasErrors => hasErrorName;//|| email != null || password != null;

  bool get hasErrorName => nameCtrl.text == null || nameCtrl.text.isEmpty;

  Associated _setFieldsToUpdate() {
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

  String changedDropDownItem (selected) => currentBloodType = selected;

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

class FormController extends FormControllerBase
    with _$FormController {

  FormController({String name}) {
    super.name = name;
  }

}

abstract class FormControllerBase with Store {
  @observable
  String name;

/*
  @observable
  String email;

  @observable
  String password;*/

  @action
  changeName(String value) {
    print('---------- changeName ----------');
    name = value;
    print('name: $name');
  }

}