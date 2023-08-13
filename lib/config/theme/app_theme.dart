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
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({required this.selectedColor, this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
