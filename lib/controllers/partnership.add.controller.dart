import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/repositories/partnership.repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'partnership.add.controller.g.dart';

class PartnershipAddController = PartnershipAddControllerBase
    with _$PartnershipAddController;

abstract class PartnershipAddControllerBase with Store {
  var formController;

  @observable
  var idCtrl = TextEditingController();

  @observable
  var partnerCtrl = TextEditingController();

  @observable
  var phone1Ctrl = TextEditingController();

  @observable
  var phone2Ctrl = TextEditingController();

  @observable
  var addressCtrl = TextEditingController();

  @observable
  var promotionCtrl = TextEditingController();

  @observable
  var statusCtrl = TextEditingController();

  @observable
  String photoUrl;

  @observable
  String photoPath;

  @observable
  File photo;

  @observable
  bool changedPhoto = false;

  @observable
  bool isActive = true;

  @observable
  String currentStatus;

  @observable
  Partnership partnership;

  @observable
  PartnershipRepo _partnershipRepo = PartnershipRepo();

  @observable
  String errorMsg;

  @action
  setStatus() => isActive = !isActive;

  get init {
    _initTextFields;
    currentStatus = statusCtrl.text;
    formController = FormController(
      partner: partnership != null ? partnership.partner : '',
    );
  }

  get _initTextFields {
    partnerCtrl.text = partnership != null ? partnership.partner : null;
    phone1Ctrl.text = partnership != null ? partnership.phone1 : null;
    phone2Ctrl.text = partnership != null ? partnership.phone2 : null;
    addressCtrl.text = partnership != null ? partnership.address : null;
    promotionCtrl.text = partnership != null ? partnership.promotion : null;
    statusCtrl.text = partnership != null ? partnership.status : null;
  }

  @action
  Future findAll() async =>
      await _partnershipRepo.findAll().then((value) => value).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future save() async => await _partnershipRepo
          .save(await _setValues())
          .then((value) => value)
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  @action
  Future update(Partnership partnership) async =>
      await _partnershipRepo.update(await _setValues()).catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<Partnership> _setValues2() async {
    partnership.partner = partnerCtrl.text;
    partnership.phone1 = phone1Ctrl.text;
    partnership.phone2 = phone2Ctrl.text;
    partnership.address = addressCtrl.text;
    partnership.promotion = promotionCtrl.text;
    partnership.status = statusCtrl.text;
/*    if (photo != null) {
      //se houve alteração de foto
      _savePhoto();
      await _uploadPhoto().then((value) => associated.photoUrl = value);
    }*/
    return partnership;
  }

  Future<Partnership> _setValues() async {
    return Partnership(
      id: int.parse('0'),
      partner: partnerCtrl.text,
      phone1: phone1Ctrl.text,
      phone2: phone2Ctrl.text,
      address: addressCtrl.text,
      promotion: promotionCtrl.text,
      status: statusCtrl.text,
    );
  }

  bool get hasErrors => hasErrorPartner;

  bool get hasErrorPartner => validatePartner() != null;

  String changedStatusDropDownItem(selected) => currentStatus = selected;

  String validatePartner() {
    if (formController.partner.isEmpty) {
      return "Parceiro é obrigatório!!!";
    }
    return null;
  }

  @action
  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
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
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      changedPhoto = true;
      photoPath = photo.path.toString();
    }
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String partner}) {
    super.partner = partner;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String partner;

  @action
  changePartner(String value) => partner = value;
}
