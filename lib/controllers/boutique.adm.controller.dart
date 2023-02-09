import 'dart:async';
import 'package:flutter/material.dart';
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

  @observable
  List<Product> products = [];

  @observable
  ProductFirebaseRepo firebaseRepo = ProductFirebaseRepo();

  @observable
  Future<List<Product>> future = Future<List<Product>>.value([]);

  @observable
  String filter = '';

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Product>> findAll() async => await firebaseRepo.findProducts();

  Future<List<Product>> getFuture() => future = findAll();

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
