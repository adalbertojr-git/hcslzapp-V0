import 'package:glutton/glutton.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  @observable
  String photoUrl;

  @observable
  Associated associated;

  init() {
    photoUrl = associated.photoUrl;
  }

  @action
  setPhoto(String value) => photoUrl = value;

/*  @observable
  String photoPath;

  @observable
  String errorMsg;

  init() {
    getPhotoFromDevice().then((value) => photoPath = value);
  }

  @action
  setPhoto(String value) => photoPath = value;

  Future<String> getPhotoFromDevice() async {
    return await Glutton.vomit("photoPath");
  }*/

  String getFirstName (String fullName) {
    var names = fullName.split(' ');
    return names[0];
  }
}
