import 'package:flutter/material.dart';

Color? getColor(String color) {
  if (colorMap.containsKey(color)) {
    return colorMap[color];
  }
  return Colors.white;
}

final Map<String, Color> colorMap = {
  'preta': Colors.black87,
  'azul': Colors.blue,
  'rosa': Colors.pinkAccent,
};