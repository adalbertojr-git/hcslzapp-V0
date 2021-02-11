import 'package:flutter/material.dart';

enum AssociatedStatus {
  A,
  I,
}

extension AssociatedStatusExt on AssociatedStatus {
  static const associatedStatusMap = {
    AssociatedStatus.A: "Ativo",
    AssociatedStatus.I: "Inativo",
  };

  //prints enum index and custom message
  void associatedStatusToString() {
    print("${this.index} ${this.description}");
  }

  //about property returns the custom message
  String get description => associatedStatusMap[this];
}

List<DropdownMenuItem<String>> getAssociatedStatus() {
  List _associatedStatus = List();
  List<DropdownMenuItem<String>> types = new List();
  AssociatedStatus.values.forEach((v) => _associatedStatus.add(v.description));
  for (String type in _associatedStatus) {
    types.add(new DropdownMenuItem(value: type, child: new Text(type)));
  }
  return types;
}
