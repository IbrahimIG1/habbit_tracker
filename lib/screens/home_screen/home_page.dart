import 'package:flutter/material.dart';
import 'package:habbit_tracker/core/cubit/cubit/app_cubit.dart';
import 'package:habbit_tracker/core/cubit/cubit/app_state.dart';
import 'package:habbit_tracker/screens/home_screen/widgets/habbit_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // void habbitStart(int index) {
    //   print('click start');

    //   print("befor click ${list[index]['is_start']}");

    //   list[index]['is_start'] = !list[index]['is_start'];
    //   print("after click ${list[index]['is_start']}");
    // }

    // void settingOpen(int index) {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text("Setting for ${list[index]["habbit_name"]}"),
    //         );
    //       });
    // }

    return Scaffold(
        appBar: AppBar(
          title: const Text('consistencey is key.'),
          centerTitle: false,
        ),
        body: BlocConsumer<AppCubit, AppCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            var appCubit = AppCubit.get(context);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: appCubit.list.length,
                      itemBuilder: (context, index) {
                        return HabbitCard(
                          index: index,
                          habbitName: appCubit.list[index]["habbit_name"],
                          startTime: appCubit.list[index]["start_time"],
                          goalTime: appCubit.list[index]["goal_time"],
                          settingsOpen: () {
                            appCubit.settingOpen(index, context);
                          },
                          habbitStart: () {
                            appCubit.playAndPause(index);
                          },
                          isStart: appCubit.list[index]["is_start"],
                        );
                      }),
                )
              ],
            );
          },
        ));
  }
}
