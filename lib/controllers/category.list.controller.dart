import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../models/category.dart';
import '../repositories/product.firebase.repo.dart';

part 'category.list.controller.g.dart';

class CategoryListController = CategoryListControllerBase with _$CategoryListController;

abstract class CategoryListControllerBase with Store {
  @observable
  var titleCtrl = TextEditingController();

  @observable
  bool isHidedButton = true;

  @observable
  List<Category> categories = [];

  @observable
  ProductFirebaseRepo firebaseRepo = ProductFirebaseRepo();

  @observable
  Future<List<Category>> future = Future<List<Category>>.value([]);

  @observable
  String filter = '';

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  @action
  Future<List<Category>> findAll() async => await firebaseRepo.findCategories();

  Future<List<Category>> getFuture() => future = findAll();

  @action
  setFilter(String value) => filter = value;

  @computed
  List<Category> get listFiltered {
    if (filter.isEmpty) {
      return List<Category>.from(categories);
    } else {
      return List<Category>.from(
          categories.where((element) => element.title!.contains(filter)));
    }
  }
}
