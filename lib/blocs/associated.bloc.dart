import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/repositories/associated.repo.dart';

class AssociatedBloc extends ChangeNotifier {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController sponsorCtrl = TextEditingController();
  TextEditingController associatedTypeCtrl = TextEditingController();
  TextEditingController cnhCtrl = TextEditingController();
  TextEditingController cpfCtrl = TextEditingController();
  TextEditingController bloodTyoeCtrl = TextEditingController();
  TextEditingController dateBirthCtrl = TextEditingController();
  TextEditingController dateShieldCtrl = TextEditingController();
  final AssociatedRepo _associatedRepo = AssociatedRepo();

  Future<List<Associated>> findByCode(int code) async {
    return _associatedRepo.findByCode(code).catchError((e) {
      print('TimeOutException: ${e.toString()}');
    }, test: (e) => e is TimeoutException).catchError((e) {
      print('Exception: ${e.toString()}');
    }, test: (e) => e is Exception);
  }
}
