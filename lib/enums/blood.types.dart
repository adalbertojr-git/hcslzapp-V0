import 'package:flutter/material.dart';

enum BloodType {
  A_POSITIVE,
  A_NEGATIVE,
  B_POSITIVE,
  B_NEGATIVE,
  O_POSITIVE,
  O_NEGATIVE,
  AB_POSITIVE,
  AB_NEGATIVE,
}

extension BloodTypeExt on BloodType {
  static const bloodTypesMap = {
    BloodType.A_NEGATIVE: 'A-',
    BloodType.A_POSITIVE: 'A+',
    BloodType.B_NEGATIVE: 'B-',
    BloodType.B_POSITIVE: 'B+',
    BloodType.O_NEGATIVE: 'O-',
    BloodType.O_POSITIVE: 'O+',
    BloodType.AB_NEGATIVE: 'AB-',
    BloodType.AB_POSITIVE: 'AB+',
  };

  //prints enum index and custom message
  void bloodTypeToString() {
    print("${this.index} ${this.description}");
  }

  //about property returns the custom message
  String? get description => bloodTypesMap[this];
}

List<DropdownMenuItem<String>> getBloodTypes() {
  List<String> _bloodTypes = List<String>.empty(growable: true);
  List<DropdownMenuItem<String>> types =
      List<DropdownMenuItem<String>>.empty(growable: true);
  BloodType.values.forEach((v) => _bloodTypes.add(v.description ?? ""));
  for (String type in _bloodTypes) {
    types.add(DropdownMenuItem(value: type, child: new Text(type)));
  }
  return types;
}
