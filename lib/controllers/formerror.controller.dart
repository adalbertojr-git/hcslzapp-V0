import 'package:mobx/mobx.dart';

part 'formerror.controller.g.dart';

class FormErrorController = FormErrorControllerBase
    with _$FormErrorController;

abstract class FormErrorControllerBase with Store {
  @observable
  String name;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => name != null || email != null || password != null;

  @action
  changeName(String value) {
    name = value;
    print('name: $name');
  }
}