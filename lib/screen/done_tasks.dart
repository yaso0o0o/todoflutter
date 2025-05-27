import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/task_cubit.dart';
import 'package:flutter_application_1/widget/taskWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DoneTasksScreen extends StatefulWidget {
  const DoneTasksScreen({super.key});

  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  void initState() {
    super.initState();
    TaskCubit.get(context).getDoneTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Done Task"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "playfair",
          fontSize: 30,
        ),
      ),
      body: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is RemoveTaskSuccess) {
            TaskCubit.get(context).doneTaskList.removeWhere(
                  (element) {
                return element.id == state.removeId;
              },
            );
          }
        },
        builder: (context, state) {
          if (TaskCubit.get(context).doneTaskList.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 43),
                child: Lottie.asset(
                  "assets/animation/sleep.json",
                ),
              ),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount:
              TaskCubit.get(context).doneTaskList.length,
              itemBuilder: (context, index) {
                return Taskweight(
                  taskModel:
                  TaskCubit.get(context).doneTaskList[index],
                  removePressed: () {
                    TaskCubit.get(context).removeTask(
                        removeId: BlocProvider.of<TaskCubit>(context)
                            .doneTaskList[index]
                            .id ??
                            0);
                  },
                  editPressed: () {},
                  donePressed: () {},
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            );
          }
        },
      ),
    );
  }
}
