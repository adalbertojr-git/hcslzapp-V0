import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';

class AssociatedBloc extends ChangeNotifier {
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
}
