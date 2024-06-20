import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabbitCard extends StatelessWidget {
  final String habbitName;
  final int startTime;
  final int goalTime;
  final VoidCallback settingsOpen;
  final VoidCallback habbitStart;
  late bool isStart;
  final int index;

  HabbitCard({
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
    // convert seconds into min:sec -> e.g. 65 seconds = 1:05
    String fromSecToMin(int totalSeconds) {
      String sec = (totalSeconds % 60).toString();
      String min = (totalSeconds / 60)
          .toStringAsFixed(3); // 190 / 60 = 3.166666666666667 => 3.1

      if (sec.length == 1) {
        sec = "0$sec";
      }
      if (min[1] == '.') {
        min = min.substring(0, 1); // 190 / 60 = 3.166666666666667 => 3
      }

      return "$min:$sec";
    }

    calculatPrecentage() {
      var result = startTime / (goalTime * 60);
      if (result * 100 == 100) {
        isStart = false;
      }
      return result;
    }

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
                // animation: true,
                // animationDuration: 3000,
                progressColor: calculatPrecentage() > 0.75
                    ? Colors.green
                    : (calculatPrecentage() > 0.45
                        ? Colors.orange
                        : Colors.red),
                percent: calculatPrecentage() < 1 ? calculatPrecentage() : 1,
                center: IconButton(
                  onPressed: habbitStart,
                  icon: Icon(!isStart
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(habbitName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(
                    '${fromSecToMin(startTime)}/ $goalTime  = ${(calculatPrecentage() * 100).toStringAsFixed(0)}%',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
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
