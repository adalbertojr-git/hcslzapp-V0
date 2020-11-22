import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'motorcycle.controller.g.dart';

class MotorcycleController = MotorcycleControllerBase
    with _$MotorcycleController;

abstract class MotorcycleControllerBase with Store {
  @observable
  var idCtrl = TextEditingController();

  @observable
  var modelCtrl = TextEditingController();

  @observable
  var yearCtrl = TextEditingController();

  @observable
  var colorCtrl = TextEditingController();

  @observable
  var licencePlateCtrl = TextEditingController();

  @observable
  var nicknameCtrl = TextEditingController();

  @observable
  var chassisCtrl = TextEditingController();

  @observable
  var renavamCtrl = TextEditingController();


}
