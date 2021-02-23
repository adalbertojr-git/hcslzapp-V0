import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:glutton/glutton.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase
    with _$DashboardController;

abstract class DashboardControllerBase with Store {

  @observable
  int associatedId;

  @observable
  Uint8List photo;

  @observable
  String errorMsg;

  get init {
    _getPhoto();
  }

  _getPhoto() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('profilePhotos/${this.associatedId}')
        .getData(10000000)
        .then((data) {
      this.photo = data;
    }).catchError((e) => this.errorMsg = "${e.message}");
  }

}
