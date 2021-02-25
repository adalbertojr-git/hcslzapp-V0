import 'package:glutton/glutton.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase
    with _$DashboardController;

abstract class DashboardControllerBase with Store {

  @observable
  String photoPath;

  get init async {
    photoPath = await getPhoto();
  }

  @action
  setPhoto(String value) => photoPath = value;

  Future<String> getPhoto() async {
    return await Glutton.vomit("photoPath");
  }

}
