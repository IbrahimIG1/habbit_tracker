import 'package:flutter/material.dart';
import 'package:habbit_tracker/core/cubit/cubit/app_cubit.dart';
import 'package:habbit_tracker/screens/home_screen/home_page.dart';
import 'package:habbit_tracker/core/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: BlocProvider(
        create: (context) => AppCubit(),
        child: const HomePage(),
      ),
    );
  }
}
