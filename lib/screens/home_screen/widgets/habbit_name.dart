import 'package:flutter/material.dart';

class HabbitName extends StatelessWidget {
  final String habbitName;
  final int startTime;
  final int goalTime;
   const HabbitName({super.key,required this.habbitName, required this.startTime, required this.goalTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(habbitName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(
          '$startTime / $goalTime',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
