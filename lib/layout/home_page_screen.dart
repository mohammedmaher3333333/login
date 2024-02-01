import 'package:flutter/material.dart';
import 'package:iteda_flutter_course/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:iteda_flutter_course/modules/done_tasks/done_tasks_screen.dart';
import 'package:iteda_flutter_course/modules/new_tasks/new_tasks_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex=0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List titles = [
    "Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),body: Form(
        child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Tasks',),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: "Done"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive), label: "Archived"),
        ],
      ),
    );
  }
}
