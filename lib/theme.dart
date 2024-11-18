import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pinkAccent,
    brightness: Brightness.light,

    ///grey[200]
    primaryContainer: Colors.grey[200],

    ///white
    secondaryContainer: Colors.white,

    ///grey[300]
    tertiaryContainer: Colors.grey[300],
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.dark,

    ///grey[200]
    primaryContainer: Colors.black,

    ///white
    secondaryContainer: Colors.grey[800],

    ///grey[300]
    tertiaryContainer: Colors.grey[500],
  ),
);
