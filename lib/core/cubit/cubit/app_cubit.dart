import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    {
      "habbit_name": "Read",
      "is_start": false,
      "start_time": 0,
      "goal_time": 10
    },
    {
      "habbit_name": "Wirte",
      "is_start": false,
      "start_time": 0,
      "goal_time": 10
    },
    {
      "habbit_name": "Pray",
      "is_start": false,
      "start_time": 0,
      "goal_time": 10
    },
  ];

  IconData startAndPauseIcon = Icons.play_arrow_rounded;
  void playAndPause(int index) {
    // change icon (play and pause)
    // if (list[index]["start_time"] == list[index]["goal_time"]) {
    //   startAndPauseIcon = Icons.play_arrow_rounded;
    // }
    list[index]["is_start"] = !list[index]["is_start"];
    habbitTimerPlay(index);
    emit(PlayAndPauseState());
  }

  void settingOpen(int index, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("setting for ${list[index]["habbit_name"]}"),
        );
      },
    );
    // emit(SettingState());
  }

  void habbitTimerPlay(int index) {
    // time when button clicked
    DateTime startTime = DateTime.now();
    int elapsedTime = list[index]['start_time'];
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // time counter every 1 second
      DateTime currentTime = DateTime.now();
      print(startTime.minute);
      if (list[index]['is_start']) {
        // this Calculation to not get muins number and added {elapsedTime} to not starrt from 0 again
        list[index]['start_time'] = elapsedTime +
            currentTime.second -
            startTime.second +
            60 * (currentTime.minute - startTime.minute) +
            60 * 60 * (currentTime.hour - startTime.hour);
      } else {
        startAndPauseIcon = Icons.play_arrow_rounded;
        timer.cancel();
        emit(TimerPlayState());
      }
      emit(TimerPlayState());
    });
  }

  calculatPrecentage(int index) {
    var result = list[index]['start_time'] / (list[index]['time_goal'] * 60);
    return result * 100;
  }
}
