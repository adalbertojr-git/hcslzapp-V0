import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import '../repositories/event.repo.dart';

part 'event.add.controller.g.dart';

class EventAddController = EventAddControllerBase with _$EventAddController;

abstract class EventAddControllerBase with Store {
  var formController;

  @observable
  var idCtrl = TextEditingController();

  @observable
  var titleCtrl = TextEditingController();

  @observable
  var descriptionCtrl = TextEditingController();

  @observable
  var iniDateCtrl = TextEditingController();

  @observable
  var endDateCtrl = TextEditingController();

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
  String eventDate = '';

  init() {
    _initTextFields();
    photoUrl = event.photoUrl;
    formController = FormController(
      title: event.title,
      description: event.description,
    );
  }

  _initTextFields() {
    titleCtrl.text = event.title;
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
    } else
      _lPhotoUrl = photoUrl;
    return Event(
        id: event.id,
        title: titleCtrl.text,
        date: eventDate,
        description: descriptionCtrl.text,
        photoUrl: _lPhotoUrl);
  }

  bool get hasErrors => hasErrorPartner || hasErrorDescription;

  bool get hasErrorPartner => validateTitle() != null;

  bool get hasErrorDescription => validateDescription() != null;

  String? validateTitle() {
    const String _labelTitleRequired = 'Título do evento é obrigatório!!!';

    if (formController.title.isEmpty) {
      return _labelTitleRequired;
    }
    return null;
  }

  String? validateDescription() {
    const String _labelDescriptionRequired =
        'Descrição do evento é obrigatória!!!';

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
          'eventPhotos/${DateTime.now().millisecondsSinceEpoch}',
        );
    await reference.putFile(photo);
    return await reference.getDownloadURL();
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? title,
    String? description,
  }) {
    super.title = title;
    super.description = description;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? title;

  @observable
  String? description;

  @action
  changeTitle(String value) => title = value;

  @action
  changeDescription(String value) => description = value;
}
