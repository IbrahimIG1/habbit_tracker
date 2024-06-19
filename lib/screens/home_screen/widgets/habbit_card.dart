import 'package:flutter/material.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/habbit_timer.dart';

class HabbitCard extends StatefulWidget {
  final String habbitName;
  final String startTime;
  final String goalTime;
  final VoidCallback settingsOpen;
  final VoidCallback habbitStart;
  final bool isStrat;
  final int index;
  const HabbitCard(
      {super.key,
      required this.index,
      required this.habbitName,
      required this.startTime,
      required this.goalTime,
      required this.settingsOpen,
      required this.habbitStart, required this.isStrat});

  @override
  State<HabbitCard> createState() => _HabbitCardState();
}

class _HabbitCardState extends State<HabbitCard> {
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
          HabbitTimer(
              isStart: widget.isStrat,
              habbitName: widget.habbitName,
              startTime: widget.startTime,
              goalTime: widget.goalTime,
             
              habbitStart: widget.habbitStart),
          GestureDetector(
            onTap: widget.settingsOpen,
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
