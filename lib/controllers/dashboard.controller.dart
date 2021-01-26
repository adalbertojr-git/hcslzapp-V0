import 'dart:async';
import 'package:glutton/glutton.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase
    with _$DashboardController;

abstract class DashboardControllerBase with Store {

  @observable
  String filePath;

  get init {
    getPhoto().then((value) => this.filePath = value);
  }

  Future<String> getPhoto() async {
    return await Glutton.vomit("photoPath");
  }

}
