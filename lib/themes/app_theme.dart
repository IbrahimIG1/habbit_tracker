import 'package:flutter/material.dart';
import 'package:habbit_tracker/themes/app_bar_theme.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: appBarTheme(), scaffoldBackgroundColor: Colors.grey[100]!);
}
