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
  List<String> categories = [];

  @observable
  List<Product> products = [];

  @observable
  ProductFirebaseRepo firebaseRepo = ProductFirebaseRepo();

  @observable
  // By default our first item will be selected
  int selectedIndex = 0;

  @observable
  String filter = '';

  init() async {
    categories.clear();
    products.clear();
  }

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

/*  @action
  Future<List<String>> getCategories() => firebaseRepo.getCategories();*/

  @action
  // Future<void> getAll() => firebaseRepo.getAll();
  Future<List<Product>> getAll() => firebaseRepo.getAll();

  @action
  Future<void> getOne() => firebaseRepo.getOne();

  @action
  Future<List<String>> getProductsByCategory() =>
      firebaseRepo.getProductsByCategory('Camisas');

  @action
  setSelectedIndex(int index) => selectedIndex = index;

  @action
  List<String> getCategories() {
    categories.add('Todas');
    products.forEach((element) {
      categories.add(element.category!);
    });
    return categories;
  }

  @action
  setFilter(String value) => filter = value;

  @computed
  List<Product> get listFiltered {
    if (filter == 'Todas') {
      return List<Product>.from(products);
    } else {
      return List<Product>.from(
          products.where((element) => element.category!.contains(filter)));
    }
  }
}
