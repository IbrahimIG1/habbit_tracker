import 'package:flutter/material.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/habbit_name.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabbitTimer extends StatefulWidget {
  final String habbitName;
  final String startTime;
  final String goalTime;
  final bool isStart;

  final VoidCallback habbitStart;

  const HabbitTimer(
      {super.key,
      required this.habbitName,
      required this.startTime,
      required this.goalTime,

      required this.habbitStart, required this.isStart});

  @override
  State<HabbitTimer> createState() => _HabbitTimerState();
}

class _HabbitTimerState extends State<HabbitTimer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          radius: 40,
          animation: true,
          animationDuration: 3000,
          progressColor: Colors.green,
          percent: 1,
          center: IconButton(
            onPressed: widget.habbitStart,
            icon: Icon(widget.isStart
                ? Icons.pause_outlined
                : Icons.play_arrow_rounded),
          ),
        ),
        SizedBox(width: 20),
        HabbitName(
          habbitName: widget.habbitName,
          startTime: widget.startTime,
          goalTime: widget.goalTime,
        ),
      ],
    );
  }
}

