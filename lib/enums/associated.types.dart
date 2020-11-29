import 'package:flutter/material.dart';

enum AssociatedType {
  MF,
  ME,
  MB,
}

extension AssociatedTypeExt on AssociatedType {
  static const associatedTypesMap = {
    AssociatedType.MF: "MF - Membro Fundador",
    AssociatedType.ME: "ME - Membro Efetivo",
    AssociatedType.MB: "MB - Membro Benemérito",
  };

  //prints enum index and custom message
  void associatedTypeToString() {
    print("${this.index} ${this.description}");
  }

  //about property returns the custom message
  String get description => associatedTypesMap[this];
}
