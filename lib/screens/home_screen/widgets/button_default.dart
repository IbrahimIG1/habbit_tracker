import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final VoidCallback onPressedFunction;
  const ButtonDefault(
      {super.key, required this.text, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            elevation: 3.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.white,
                ))),
        onPressed: onPressedFunction,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
