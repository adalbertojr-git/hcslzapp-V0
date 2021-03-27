import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/repositories/partnership.repo.dart';
import 'package:mobx/mobx.dart';

part 'partnership.list.controller.g.dart';

class PartnershipListController = PartnershipListControllerBase
    with _$PartnershipListController;

abstract class PartnershipListControllerBase with Store {
  @observable
  bool isHidedButton = true;

  @observable
  Partnership partnership;

  @observable
  ObservableList partnerships = [].asObservable();

  @observable
  PartnershipRepo _partnershipRepo = PartnershipRepo();

  @observable
  Future<List<Partnership>> future;

  @observable
  String errorMsg;

  @action
  bool setButtonVisibilty() => isHidedButton = !isHidedButton;

  get init {
    partnerships.clear();
  }

  @action
  Future findAll() =>
      ObservableFuture(_partnershipRepo.findAll().then((value) => value))
          .catchError((e) {
        errorMsg = "${e.message}";
      }, test: (e) => e is Exception);

  Future<List<Partnership>> getFuture() => future = findAll();

}
