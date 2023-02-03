import 'dart:async';
import 'package:mobx/mobx.dart';
import '../models/product.dart';
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

  init() async {
    categories.clear();
    await getAll();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<String>> getCategories() => firebaseRepo.getCategories();

  @action
  // Future<void> getAll() => firebaseRepo.getAll();
  Future<List<Products>> getAll() => firebaseRepo.getAll();

  @action
  Future<void> getOne() => firebaseRepo.getOne();

  @action
  Future<List<String>> getProductsByCategory() => firebaseRepo.getProductsByCategory('Camisas');

  @action
  setSelectedIndex(int index) => selectedIndex = index;
}
