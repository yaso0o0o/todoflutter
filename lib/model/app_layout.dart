import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/done_tasks.dart';
import 'package:flutter_application_1/screen/in_progress_task.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key});

  @override
  State<AppLayoutScreen> createState() => _AppLayoutScreenState();
}

class _AppLayoutScreenState extends State<AppLayoutScreen> {
  List<Widget> screensList =[
    const InProgressTaskScreen(),
    const DoneTasksScreen(),
  ];
    int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffe53170),
        unselectedItemColor: Colors.grey,
        onTap: (index){
          currentIndex = index ;
          setState(() {
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.today
              ),
            label: "Tasks"
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.task_alt
            ),
            label: "Done"
          ),
        ],
      ),
    );
  }
}

