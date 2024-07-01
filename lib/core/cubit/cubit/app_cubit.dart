import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/button_default.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/text_form_feild_default.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> list = [
    {
      "habbit_name": "Exersice",
      "is_start": false,
      "start_time": 0,
      "goal_time": 1
    },
    {"habbit_name": "Read", "is_start": false, "start_time": 0, "goal_time": 1},
    {
      "habbit_name": "Wirte",
      "is_start": false,
      "start_time": 0,
      "goal_time": 1
    },
    {"habbit_name": "Pray", "is_start": false, "start_time": 0, "goal_time": 1},
  ];

  IconData startAndPauseIcon = Icons.play_arrow_rounded;
  void playAndPause(int index) {
    if (list[index]["start_time"] / 60 == list[index]["goal_time"]) {
      print("Repeat agian...");
      repeatHabbitAgain(index);
    } else {
      list[index]["is_start"] = !list[index]["is_start"];
      print("is_start is => ${list[index]["is_start"]}");
    }
    if (list[index]["is_start"]) {
      habbitTimerPlay(index);
    }
    emit(PlayAndPauseState());
  }

  void settingOpen(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            height: 230,
            width: 200,
            child: Column(
              children: [
                TextFormFeildDefault(
                    hintText: 'Habit name',
                    controller: TextEditingController()),
                SizedBox(height: 15),
                TextFormFeildDefault(
                    hintText: 'Time', controller: TextEditingController()),
                Row(
                  children: [
                    Expanded(
                        child: ButtonDefault(
                            text: "reset",
                            onPressedFunction: () {
                              print('reset');
                            })),
                    SizedBox(width: 15),
                    Expanded(
                        child: ButtonDefault(
                            text: "Save",
                            onPressedFunction: () {
                              print("save");
                            })),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    // emit(SettingState());
  }

  void habbitTimerPlay(int index) {
    DateTime startTime = DateTime.now();
    int elapsedTime = list[index]['start_time'];
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // time counter every 1 second
      DateTime currentTime = DateTime.now();
      if (list[index]["start_time"] / 60 == list[index]["goal_time"]) {
        timeIsDone(index, timer);
        emit(TimerPlayState());
      } else if (list[index]['is_start']) {
        list[index]['start_time'] = elapsedTime +
            currentTime.second -
            startTime.second +
            60 * (currentTime.minute - startTime.minute) +
            60 * 60 * (currentTime.hour - startTime.hour);
        emit(TimerPlayState());
      } else {
        timer.cancel();
      }
    });
  }

  /// this Calculation to not get timer number as seconds and added [elapsedTime] to not start from 0 again
  timerCalculation(
      int index, int elapsedTime, currentTime, DateTime startTime) {
    list[index]['start_time'] = elapsedTime +
        currentTime.second -
        startTime.second +
        60 * (currentTime.minute - startTime.minute) +
        60 * 60 * (currentTime.hour - startTime.hour);
  }

  /// use to pause timer when time = 100 % ;
  timeIsDone(int index, Timer timer) {
    list[index]["is_start"] = false;
    startAndPauseIcon = Icons.play_arrow_rounded;
    timer.cancel();
  }

  /// repeate habbit one more after done 100 %
  repeatHabbitAgain(int index) {
    list[index]["is_start"] = true;
    list[index]["start_time"] = 0;
    startAndPauseIcon = Icons.pause_rounded;
  }
}
