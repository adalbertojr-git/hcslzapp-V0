import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../models/product.dart';
import '../repositories/product.firebase.repo.dart';

part 'boutique.adm.controller.g.dart';

class BoutiqueAdmController = BoutiqueAdmControllerBase with _$BoutiqueAdmController;

abstract class BoutiqueAdmControllerBase with Store {
  @observable
  var nameCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

/*
  @observable
  List<String> categories = [];
*/

  @observable
  List<Product> products = [];

  @observable
  ProductFirebaseRepo firebaseRepo = ProductFirebaseRepo();

  @observable
  Future<List<Product>> future = Future<List<Product>>.value([]);

/*  @observable
  // By default our first item will be selected
  int selectedIndex = 0;*/

  @observable
  String filter = '';

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Product>> findAll() async => await firebaseRepo.findAll();

  Future<List<Product>> getFuture() => future = findAll();

/*  @action
  Future<void> getOne() => firebaseRepo.getOne();

  @action
  Future<List<String>> getProductsByCategory() =>
      firebaseRepo.getProductsByCategory('Camisas');*/

/*  @action
  setSelectedIndex(int index) => selectedIndex = index;

  @action
  List<String> getCategories() {
    categories.add('Todos');
    products.forEach((element) {
      if (!categories.contains(element.category)) {
        categories.add(element.category!);
      }
    });
    return categories;
  }*/

  @action
  setFilter(String value) => filter = value;

  @computed
  List<Product> get listFiltered {
    if (filter.isEmpty) {
      return List<Product>.from(products);
    } else {
      return List<Product>.from(
          products.where((element) => element.name!.contains(filter)));
    }
  }
}
