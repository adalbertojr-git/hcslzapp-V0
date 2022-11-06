import '../models/authenticate.dart';
import 'package:mobx/mobx.dart';

part 'item.model.g.dart';

class ItemModel = ItemModelBase with _$ItemModel;

abstract class ItemModelBase with Store {
  ItemModelBase({
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
    required this.authenticate,
    required this.email,
    required this.user,
    required this.password,
    required this.check,
  });

  @observable
  int id;

  @observable
  String? name;

  @observable
  String? phone;

  @observable
  String? status;

  @observable
  Authenticate? authenticate;

  @observable
  String? email;

  @observable
  String? user;

  @observable
  String? password;

  @observable
  bool? check;

  @action
  setCheck(bool value) => check = value;
}
