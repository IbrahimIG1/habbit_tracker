import 'package:flutter/material.dart';
import 'package:habbit_tracker/screens/home_screen/home_page.dart';
import 'package:habbit_tracker/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: const HomePage(),
    );
  }
}
