import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../repositories/event.repo.dart';

part 'product.add.controller.g.dart';

class ProductAddController = ProductAddControllerBase with _$ProductAddController;

abstract class ProductAddControllerBase with Store {
  var formController;

  @observable
  var idCtrl = TextEditingController();

  @observable
  var nameCtrl = TextEditingController();

  @observable
  var descriptionCtrl = TextEditingController();

  @observable
  var categoryCtrl = TextEditingController();

  @observable
  var colorCtrl = TextEditingController();

  @observable
  String photoUrl = '';

  @observable
  String photoPath = '';

  @observable
  File photo = File('');

  @observable
  bool changedPhoto = false;

  @observable
  Event event = Template().loadEvent();

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  String selectedDate = '';

  @observable
  String pickedInitialDate = '';

  @observable
  String pickedEndDate = '';

  init() {
    _initTextFields();
    photoUrl = event.photoUrl;
    formController = FormController(
      name: event.title,
      description: event.description,
    );
  }

  _initTextFields() {
    nameCtrl.text = event.title;
    descriptionCtrl.text = event.description;
  }

  @action
  Future<Event> save() async => _eventRepo.save(
        await _setValues(),
      );

  @action
  Future<Event> update() async => _eventRepo.update(
        await _setValues(),
      );

  Future<Event> _setValues() async {
    String _lPhotoUrl = '';
    if (photo.path != '') {
      //se houve alteração de foto
      await _uploadPhoto().then((value) => _lPhotoUrl = value);
    } else {
      _lPhotoUrl = photoUrl;
    }
    pickedInitialDate = formatDateYMD(
      DateFormat('dd/MM/yyyy').parse(categoryCtrl.text),
    );
    pickedEndDate = formatDateYMD(
      DateFormat('dd/MM/yyyy').parse(colorCtrl.text),
    );
    return Event(
      id: event.id,
      title: nameCtrl.text,
      initialDate: pickedInitialDate,
      endDate: pickedEndDate,
      date: '',
      description: descriptionCtrl.text,
      photoUrl: _lPhotoUrl,
      idEventReference: event.idEventReference
    );
  }

  bool get hasErrors => hasErrorPartner || hasErrorDescription;

  bool get hasErrorPartner => validateName() != null;

  bool get hasErrorDescription => validateDescription() != null;

  String? validateName() {
    const String _labelNameRequired = 'Nome do produto é obrigatório!!!';

    if (formController.name.isEmpty) {
      return _labelNameRequired;
    }
    return null;
  }

  String? validateDescription() {
    const String _labelDescriptionRequired =
        'Descrição do produto é obrigatória!!!';

    if (formController.description.isEmpty) {
      return _labelDescriptionRequired;
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
    if (event.photoUrl.isNotEmpty) {
      reference = storage.refFromURL(event.photoUrl);
      await reference.delete();
    }
    reference = storage.ref().child(
          'photos/events/${DateTime.now().millisecondsSinceEpoch}',
        );
    await reference.putFile(photo);
    return await reference.getDownloadURL();
  }

  String formatDate(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

  String formatDateYMD(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? name,
    String? description,
  }) {
    super.name = name;
    super.description = description;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? name;

  @observable
  String? description;

  @action
  changeName(String value) => name = value;

  @action
  changeDescription(String value) => description = value;
}
