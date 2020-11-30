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
  var bloodTypeCtrl = TextEditingController();

  @observable
  var dateBirthCtrl = TextEditingController();

  @observable
  var dateShieldCtrl = TextEditingController();

  @observable
  bool isHideButton = true;

  @observable
  ObservableFuture<List<Associated>> associatedListFuture;

  @observable
  ObservableList dependents = [].asObservable();

  @observable
  ObservableList motorcycles = [].asObservable();

  @observable
  String currentBloodType;

  /*
  vars nao observaveis
  */
  final AssociatedRepo _associatedRepo = AssociatedRepo();
  String errorMsg;
  Future<List<Associated>> future;
  File _image;
  final picker = ImagePicker();
  List<Dependent> dependentsDelete = List<Dependent>();

  /*
  *
  actions ----------------------------------------------------------------------
  *
  */
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
  dependentAdd(Dependent dependent) {
    dependents.add(dependent);
    print('Dependents pós Add: $dependents');
  }

  @action
  dependentRemoveAt(int index) {
    if (dependents[index].id != 0) dependentsDelete.add(dependents[index]);
    dependents.removeAt(index);
    print('Dependents pós Delete: $dependents');
    print('DependentsDelete: $dependentsDelete');
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

  @action
  changedDropDownItem(String selected) {
    currentBloodType = selected;
  }

  /*
  *
  metodos nao observaveis-------------------------------------------------------
  *
  */

  dependentsAddAll(List<Dependent> list) {
    dependents.addAll(list);
  }

  motorcyclesAddAll(List<Motorcycle> list) {
    motorcycles.addAll(list);
  }

  update() {}

  Future<List<Associated>> getFuture(int _associatedId) =>
      future = fetchAssociated(_associatedId);

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
