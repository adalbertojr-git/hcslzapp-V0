import 'package:flutter/material.dart';

/*class ColorMap {
  final String? color;

  ColorMap(this.color);

  @override
  String toString() {
    return this.color!;
  }
}*/

Color? getColor(String color) {
  if (colorMap.containsKey(color)) {
    return colorMap[color];
  }
  return Colors.white;
}

final Map<String, Color> colorMap = {
  'preta': Colors.black,
  'azul': Colors.blue,
};