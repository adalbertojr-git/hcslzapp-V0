import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';
import 'package:mobx/mobx.dart';

part 'associated.controller.g.dart';

/*class AssociatedController extends ChangeNotifier {
  TextEditingController idCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController sponsorCtrl = TextEditingController();
  TextEditingController associatedTypeCtrl = TextEditingController();
  TextEditingController cnhCtrl = TextEditingController();
  TextEditingController cpfCtrl = TextEditingController();
  TextEditingController bloodTypeCtrl = TextEditingController();
  TextEditingController dateBirthCtrl = TextEditingController();
  TextEditingController dateShieldCtrl = TextEditingController();
  final AssociatedRepo _associatedRepo = AssociatedRepo();

  Future<List<Associated>> findByIdAssociatedToList(int id) async {
    return _associatedRepo.findByIdAssociatedToList(id).catchError((e) {
      print('TimeOutException: ${e.toString()}');
    }, test: (e) => e is TimeoutException).catchError((e) {
      print('Exception: ${e.toString()}');
    }, test: (e) => e is Exception);
  }
}*/
class AssociatedController = AssociatedControllerBase
    with _$AssociatedController;

abstract class AssociatedControllerBase with Store {
  @observable
  TextEditingController idCtrl = TextEditingController();
  @observable
  TextEditingController nameCtrl = TextEditingController();
  @observable
  TextEditingController phoneCtrl = TextEditingController();
  @observable
  TextEditingController emailCtrl = TextEditingController();
  @observable
  TextEditingController sponsorCtrl = TextEditingController();
  @observable
  TextEditingController associatedTypeCtrl = TextEditingController();
  @observable
  TextEditingController cnhCtrl = TextEditingController();
  @observable
  TextEditingController cpfCtrl = TextEditingController();
  @observable
  TextEditingController bloodTypeCtrl = TextEditingController();
  @observable
  TextEditingController dateBirthCtrl = TextEditingController();
  @observable
  TextEditingController dateShieldCtrl = TextEditingController();
  @observable
  bool isHideButton = true;
  @observable
  ObservableFuture<List<Associated>> associatedListFuture;
  final AssociatedRepo _associatedRepo = AssociatedRepo();

  @action
  setTextControllers() async {
    idCtrl.text = "1";
    nameCtrl.text = "Betao";
  }

  @action
  hideButton(bool yesNo) => isHideButton = yesNo;

  @action
  Future fetchAssociated(int id) =>
      associatedListFuture = ObservableFuture(_associatedRepo
          .findByIdAssociatedToList(id)
          .then((associated) => associated)).catchError((e) {
        print('TimeOutException: ${e.toString()}');
      }, test: (e) => e is TimeoutException).catchError((e) {
        print('Exception: ${e.toString()}');
      }, test: (e) => e is Exception);

/*
 @observable
  ObservableFuture<List<Post>> postsListFuture;
  @action
  Future fetchPosts() => postsListFuture = ObservableFuture(httpClient
      .getPosts('https://jsonplaceholder.typicode.com/posts')
      .then((posts) => posts));
*/

}
