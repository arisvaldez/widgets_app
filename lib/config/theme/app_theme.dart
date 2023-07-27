import 'package:flutter/material.dart';

enum ThemeColors { blue, green, red, pink, orange, teal, purple, yellow }

const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.pink,
  Colors.orange,
  Colors.teal,
  Colors.purple,
  Colors.yellow,
];

class AppTheme {
  final ThemeColors selectedColor;

  AppTheme({required this.selectedColor});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor.index],
        //brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
