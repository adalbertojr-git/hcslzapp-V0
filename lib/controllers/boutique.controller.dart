import 'dart:async';
import 'package:mobx/mobx.dart';
import '../repositories/product.firebase.repo.dart';

part 'boutique.controller.g.dart';

class BoutiqueController = BoutiqueControllerBase with _$BoutiqueController;

abstract class BoutiqueControllerBase with Store {
  @observable
  bool isHidedButton = true;

  @observable
  ObservableList categories = [].asObservable();

  @observable
  ProductFirebaseRepo firebaseRepo = ProductFirebaseRepo();

  @observable
  // By default our first item will be selected
  int selectedIndex = 0;

  init() {
    categories.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<String>> getCategories() => firebaseRepo.getCategories();

  @action
  setSelectedIndex(int index) => selectedIndex = index;
}
