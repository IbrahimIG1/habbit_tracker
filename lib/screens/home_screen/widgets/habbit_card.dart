import 'package:flutter/material.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/habbit_name.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabbitCard extends StatelessWidget {
  final String habbitName;
  final int startTime;
  final int goalTime;
  final VoidCallback settingsOpen;
  final VoidCallback habbitStart;
  final bool isStart;
  final int index;

  const HabbitCard({
    super.key,
    required this.index,
    required this.habbitName,
    required this.startTime,
    required this.goalTime,
    required this.settingsOpen,
    required this.habbitStart,
    required this.isStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularPercentIndicator(
                radius: 40,
                animation: true,
                animationDuration: 3000,
                progressColor: Colors.green,
                percent: 1,
                center: IconButton(
                  onPressed: habbitStart,
                  icon: Icon(
                      !isStart ? Icons.play_arrow_rounded : Icons.pause_rounded),
                ),
              ),
              const SizedBox(width: 20),
              HabbitName(
                habbitName: habbitName,
                startTime: startTime,
                goalTime: goalTime,
              ),
            ],
          ),
          GestureDetector(
            onTap: settingsOpen,
            child: const Icon(
              Icons.settings,
              // color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
