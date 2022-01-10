import 'package:flutter/material.dart';

enum Status {
  A,
  I,
}

extension StatusExt on Status {
  static const StatusMap = {
    Status.A: 'Ativo',
    Status.I: 'Inativo',
  };

  //prints enum index and custom message
  void statusToString() {
    print("${this.index} ${this.description}");
  }

  //about property returns the custom message
  String? get description => StatusMap[this];
}

List<DropdownMenuItem<String>> getStatus() {
  List<String> status = List<String>.empty(growable: true);
  List<DropdownMenuItem<String>> types =
      List<DropdownMenuItem<String>>.empty(growable: true);
  Status.values.forEach((v) => status.add(v.description ?? ""));
  for (String type in status) {
    types.add(new DropdownMenuItem(value: type, child: new Text(type)));
  }
  return types;
}
