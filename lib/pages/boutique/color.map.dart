import 'package:flutter/material.dart';

Color? getColor(String color) {
  if (colorMap.containsKey(color)) {
    return colorMap[color];
  }
  return Colors.white;
}

final Map<String, Color> colorMap = {
  'preta': Colors.black87,
  'preto': Colors.black87,
  'azul': Colors.blue,
  'azul-marinho': Colors.blueAccent,
  'rosa': Colors.pinkAccent,
  'branca': Colors.white,
  'branco': Colors.white,
  'amarelo': Colors.yellowAccent,
  'amarela': Colors.yellowAccent,
  'laranja': Colors.orange,
  'roxo': Colors.purple,
  'cinza': Colors.grey,
  'verde': Colors.lightGreen,
  'verde-escuro': Colors.green,
  'vermelho': Colors.red,
  'vermelha': Colors.red,
  'marrom': Colors.brown,
};