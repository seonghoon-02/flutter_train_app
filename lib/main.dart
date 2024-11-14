import 'package:flutter/material.dart';
import 'package:flutter_train_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,// light or dark
      // theme: lightTheme,
      // darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}