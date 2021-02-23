import 'package:mobx/mobx.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase
    with _$DashboardController;

abstract class DashboardControllerBase with Store {

  @observable
  String photoUrl;

  @action
  setPhotoUrl(String value) => photoUrl = value;

}
