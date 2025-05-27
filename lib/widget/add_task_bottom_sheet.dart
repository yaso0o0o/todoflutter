import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/task_cubit.dart';
import 'package:flutter_application_1/todo_app_screens/local_database_helper.dart';
import 'package:flutter_application_1/model/task_enum.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  List<TaskLevelEnum> levelTasks = [
    TaskLevelEnum.High,
    TaskLevelEnum.Medium,
    TaskLevelEnum.Low,
  ];
  TaskLevelEnum? value;

  String? dateTime;

  TextEditingController controller = TextEditingController();
  LocalDatabaseHelper localDatabaseHelper = LocalDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is AddNewTaskListSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: " Task Title",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xffe53170),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: "Task Level",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xffe53170),
                        ),
                      ),
                    ),
                    items: levelTasks
                        .map(
                          (level) => DropdownMenuItem(
                            value: level,
                            child: Text(
                              level.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    value: value,
                    onChanged: (level) {
                      setState(() {
                        value = level;
                      });
                    },
                    hint: const Center(
                      child: Text(
                        "Task Level",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ).then((date) {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((time) {
                        dateTime = date
                            ?.add(
                              Duration(
                                hours: time?.hour ?? 0,
                                minutes: time?.minute ?? 0,
                              ),
                            )
                            .toString();
                        setState(() {});
                      });
                    }).catchError((error) {});
                  },
                  child: Text(
                    dateTime != null
                        ? Jiffy.parse(dateTime ?? "").yMMMMEEEEdjm
                        : "Select Date",
                    style: const TextStyle(
                      color: Color(0xffe53170),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        TaskCubit.get(context).addNewTask(
                          taskModel: TaskModel(
                            isDone: false,
                            title: controller.text,
                            level: value?.name,
                            dateTime: dateTime,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffe53170),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: state is AddNewTaskListLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Add Task",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
