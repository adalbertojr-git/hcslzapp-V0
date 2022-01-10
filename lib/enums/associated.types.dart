import 'package:flutter/material.dart';

enum AssociatedType {
  MF,
  ME,
  MB,
}

extension AssociatedTypeExt on AssociatedType {
  static const associatedTypesMap = {
    AssociatedType.MF: 'Fundador',
    AssociatedType.ME: 'Efetivo',
    AssociatedType.MB: 'Benemérito',
  };

  //prints enum index and custom message
  void associatedTypeToString() {
    print("${this.index} ${this.description}");
  }

  //about property returns the custom message
  String? get description => associatedTypesMap[this];
}

List<DropdownMenuItem<String>> getAssociatedTypes() {
  List<String> _associatedTypes = List<String>.empty(growable: true);
  List<DropdownMenuItem<String>> types =
      List<DropdownMenuItem<String>>.empty(growable: true);
  AssociatedType.values
      .forEach((v) => _associatedTypes.add(v.description ?? ""));
  for (String type in _associatedTypes) {
    types.add(DropdownMenuItem(value: type, child: Text(type)));
  }
  return types;
}
