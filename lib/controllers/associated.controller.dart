import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/controllers/formerror.controller.dart';
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

  var formError = FormErrorController();

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

  @action
  hideButton() => isHideButton = !isHideButton;

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
  Future update(Associated associated) =>
      associatedUpdate = ObservableFuture(_associatedRepo
          .update(_setFieldsToUpdate())
          .then((associated) => associated)).catchError((e) {
        this.errorMsg = "TimeOutException: ${e.toString()}";
      }, test: (e) => e is TimeoutException).catchError((e) {
        this.errorMsg = "Exception: ${e.toString()}";
      }, test: (e) => e is Exception);

  @action
  dependentAdd(Dependent dependent) {
    dependents.add(dependent);
    print('Dependents pós Add: $dependents');
  }

  @action
  dependentRemoveAt(int index) {
    dependents.removeAt(index);
    print('Dependents pós Delete: $dependents');
  }

  @action
  motorcycleAdd(Motorcycle motorcycle) {
    motorcycles.add(motorcycle);
    print('Motocicletas: $motorcycles');
  }

  @action
  motorcycleRemoveAt(int index) {
    motorcycles.removeAt(index);
    print('Motocicletas: $motorcycles');
  }

  String validateName() {
    if(formError.name == null || formError.name.isEmpty) {
      return "Nome não pode ser nulo!!!";
    }
    return null;
  }

  Future<List<Associated>> getFuture(int _associatedId) =>
      future = fetchAssociated(_associatedId);

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

  changedDropDownItem(String selected) {
    currentBloodType = selected;
  }

  dependentsAddAll(List<Dependent> list) {
    dependents.addAll(list);
  }

  motorcyclesAddAll(List<Motorcycle> list) {
    motorcycles.addAll(list);
  }

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
