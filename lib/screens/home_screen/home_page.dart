import 'package:flutter/material.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/habbit_card.dart';

import 'widgets/habbit_timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        "habbit_name": "Exersice",
        "start": false,
        "start_time": "0",
        "goal_time": "10"
      },
      {
        "habbit_name": "Read",
        "start": false,
        "start_time": "0",
        "goal_time": "10"
      },
      {
        "habbit_name": "Wirte",
        "start": false,
        "start_time": "0",
        "goal_time": "10"
      },
      {
        "habbit_name": "Pray",
        "is_start": false,
        "start_time": "0",
        "goal_time": "10"
      },
    ];
    void habbitStart(int index) {
      list[index]['is_start'] = !list[index]['is_start'];
    }

    void settingOpen(int index) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Setting for ${list[index]["habbit_name"]}"),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('consistencey is key.'),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return HabbitCard(
                      index: index,
                      habbitName: list[index]["habbit_name"],
                      startTime: list[index]["habbit_name"],
                      goalTime: list[index]["habbit_name"],
                      settingsOpen: () => settingOpen(index),
                      habbitStart: () =>habbitStart(index),
                      isStrat: list[index]["is_start"],
                    );
                  }),
            )
          ],
        ));
  }
}
