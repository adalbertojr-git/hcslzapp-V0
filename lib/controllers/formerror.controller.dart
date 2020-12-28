import 'package:mobx/mobx.dart';

part 'formerror.controller.g.dart';

class FormErrorController = FormErrorControllerBase
    with _$FormErrorController;

abstract class FormErrorControllerBase with Store {
  @observable
  String name = '';
/*
  @observable
  String email;

  @observable
  String password;*/

  @computed
  bool get hasErrors => name.isEmpty ;//|| email != null || password != null;

  @action
  changeName(String value) {
    print('---------- changeName ----------');
    name = value;
    print('name: $name');
  }

  @computed
  get isValid {
    print('---------- isValid ----------');
    print(name);
    if(name == null || name.isEmpty) {
      return "Nome não pode ser nulo!!!";
    }
    return null;
  }
}