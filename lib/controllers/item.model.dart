import 'package:mobx/mobx.dart';

part 'item.model.g.dart';

class ItemModel = ItemModelBase
    with _$ItemModel;

abstract class ItemModelBase with Store {

  ItemModelBase({this.id, this.name, this.phone, this.status, this.check});

  @observable
  int id;

  @observable
  String name;

  @observable
  String phone;

  @observable
  String status;

  @observable
  bool check;

  @action
  setCheck(bool value) => check = value;

}
