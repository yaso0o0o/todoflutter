import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_application_1/widget/taske_action_widget.dart';
import 'package:jiffy/jiffy.dart';

class Taskweight extends StatelessWidget {
  final void Function() removePressed;

  final void Function() editPressed;

  final void Function() donePressed;

  final TaskModel taskModel;

  const Taskweight({
    super.key,
    required this.removePressed,
    required this.editPressed,
    required this.donePressed,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffE5E5E5),
              blurRadius: 9.36,
              offset: Offset.zero,
            ),
          ]),
      height: 120,
      width: 374.22,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title ?? "add",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: "playfair",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                taskModel.dateTime != null
                    ? Jiffy.parse(taskModel.dateTime!).yMMMMEEEEdjm
                    : "No Date",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: "playfair",
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xfffceef5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  taskModel.level ?? "Low",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.5,
                    fontFamily: "playfair",
                  ),
                ),
              )
            ],
          )),
          taskModel.isDone == true
              ? Row(
                  children: [
                    const Icon(Icons.task_alt, color: Colors.green),
                    TaskActionButton(
                      iconPath: "assets/icon/remove.svg",
                      onPressed: removePressed,
                    ),
                  ],
                )
              : Row(
                  children: [
                    TaskActionButton(
                      iconPath: "assets/icon/done.svg",
                      onPressed: donePressed,
                    ),
                    TaskActionButton(
                      iconPath: "assets/icon/edit.svg",
                      onPressed: editPressed,
                    ),
                    TaskActionButton(
                      iconPath: "assets/icon/remove.svg",
                      onPressed: removePressed,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
