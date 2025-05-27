import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/task_cubit.dart';
import 'package:flutter_application_1/model/app_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class TodoSplashScreen extends StatefulWidget {
  const TodoSplashScreen({super.key});

  @override
  State<TodoSplashScreen> createState() => _TodoSplashScreenState();
}

class _TodoSplashScreenState extends State<TodoSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is IntDatabaseSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AppLayoutScreen(),
              ),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: Lottie.asset("assets/animation/loading.json" , ),
          ),
        ),
      ),
    );
  }
}
