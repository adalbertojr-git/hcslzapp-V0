import 'package:hcslzapp/models/authenticate.dart';
import 'package:mobx/mobx.dart';

part 'item.model.g.dart';

class ItemModel = ItemModelBase with _$ItemModel;

abstract class ItemModelBase with Store {
  ItemModelBase(
      {this.id,
      this.name,
      this.phone,
      this.status,
      this.authenticate,
      this.email,
      this.check});

  @observable
  int id;

  @observable
  String name;

  @observable
  String phone;

  @observable
  String status;

  @observable
  Authenticate authenticate;

  @observable
  String email;

  @observable
  bool check;

  @action
  setCheck(bool value) => check = value;
}
