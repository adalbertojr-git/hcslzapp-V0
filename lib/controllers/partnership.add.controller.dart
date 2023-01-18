import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/models/template.dart';
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
  String photoUrl = '';

  @observable
  String photoPath = '';

  @observable
  File photo = File('');

  @observable
  bool changedPhoto = false;

  @observable
  bool isActive = true;

  @observable
  String currentStatus = '';

  @observable
  Partnership partnership = Template().loadPartnership();

  @observable
  PartnershipRepo _partnershipRepo = PartnershipRepo();

  @action
  setStatus() => isActive = !isActive;

  init() {
    _initTextFields();
    currentStatus = statusCtrl.text;
    photoUrl = partnership.photoUrl;
    formController = FormController(
      partner: partnership.partner,
    );
  }

  _initTextFields() {
    partnerCtrl.text = partnership.partner;
    phone1Ctrl.text = partnership.phone1;
    phone2Ctrl.text = partnership.phone2;
    addressCtrl.text = partnership.address;
    promotionCtrl.text = partnership.promotion;
    statusCtrl.text =
        partnership.status.length > 0 ? partnership.status : 'Ativo';
  }

  @action
  Future<List<Partnership>> findAll() => _partnershipRepo.findAll();

  @action
  Future<Partnership> save() async => _partnershipRepo.save(
        await _setValues(),
      );

  @action
  Future<Partnership> update() async => _partnershipRepo.update(
        await _setValues(),
      );

  Future<Partnership> _setValues() async {
    String _lPhotoUrl = '';
    if (photo.path != '') {
      //se houve alteração de foto
      await _uploadPhoto().then((value) => _lPhotoUrl = value);
    } else
      _lPhotoUrl = photoUrl;
    return Partnership(
      id: partnership.id,
      partner: partnerCtrl.text,
      phone1: phone1Ctrl.text,
      phone2: phone2Ctrl.text,
      address: addressCtrl.text,
      promotion: promotionCtrl.text,
      status: currentStatus,
      photoUrl: _lPhotoUrl,
    );
  }

  bool get hasErrors => hasErrorPartner;

  bool get hasErrorPartner => validatePartner() != null;

  String changedStatusDropDownItem(selected) => currentStatus = selected;

  String? validatePartner() {
    const String _labelPartnerRequired = 'Parceiro é obrigatório!!!';

    if (formController.partner.isEmpty) {
      return _labelPartnerRequired;
    }
    return null;
  }

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
    late Reference reference;
    if (partnership.photoUrl.isNotEmpty) {
      reference = storage.refFromURL(partnership.photoUrl);
      await reference.delete();
    }
    reference = storage.ref().child(
      'partnerPhotos/${DateTime.now().millisecondsSinceEpoch}',
    );
    await reference.putFile(photo);
    return await reference.getDownloadURL();
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({String? partner}) {
    super.partner = partner;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? partner;

  @action
  changePartner(String value) => partner = value;
}
