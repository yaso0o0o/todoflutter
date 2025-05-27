import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/task_cubit.dart';
import 'package:flutter_application_1/todo_app_screens/local_database_helper.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_application_1/widget/add_task_bottom_sheet.dart';
import 'package:flutter_application_1/widget/edit_task_bottom_sheet.dart';
import 'package:flutter_application_1/widget/taskWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  void initState() {
    super.initState();
    TaskCubit.get(context).getInProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("In Progress Task"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "playfair",
          fontSize: 30,
        ),
      ),
      body: BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is MakeDoneTaskSuccess) {
            TaskCubit.get(context).inProgressTaskList.removeWhere(
              (element) {
                return element.id == state.taskId;
              },
            );
          }

          if (state is RemoveTaskSuccess) {
            TaskCubit.get(context).inProgressTaskList.removeWhere(
              (element) {
                return element.id == state.removeId;
              },
            );
          }
        },
        builder: (context, state) {
          if (TaskCubit.get(context).inProgressTaskList.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 43),
                child: Lottie.asset(
                  "assets/animation/notFound.json",
                ),
              ),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: TaskCubit.get(context).inProgressTaskList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Taskweight(
                      taskModel:
                          TaskCubit.get(context).inProgressTaskList[index],
                      removePressed: () {
                        TaskCubit.get(context).removeTask(
                            removeId: TaskCubit.get(context)
                                    .inProgressTaskList[index]
                                    .id ??
                                0);
                      },
                      editPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return EditTaskBottomSheet(
                                taskModel: TaskCubit.get(context)
                                    .inProgressTaskList[index],
                              );
                            });
                      },
                      donePressed: () {
                        TaskCubit.get(context).makeDoneTask(
                            taskId: TaskCubit.get(context)
                                    .inProgressTaskList[index]
                                    .id ??
                                0);
                      },
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddTaskBottomSheet();
              }).whenComplete(() {
            TaskCubit.get(context).getInProgressTaskList();
          });
        },
        backgroundColor: const Color(0xffe53170),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: SvgPicture.asset(
          "assets/icon/add.svg",
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
