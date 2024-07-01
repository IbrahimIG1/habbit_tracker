import 'package:flutter/material.dart';

class TextFormFeildDefault extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFormFeildDefault(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      controller: controller,
    );
  }
}
