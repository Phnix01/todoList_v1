import 'package:flutter/material.dart';
import 'package:to_do_v1/widgets/todo_list.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List toDoList = [
    ['apprendre Flutter', false],
    ['courrir', false],
    ['lire pendant 30 min', false],
  ];

  void onChanged(int index, bool? value) {
    setState(() {
      toDoList[index][1] = value; // Met à jour la tâche avec la nouvelle valeur
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
          'Action de la journée',
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            isCompleted: toDoList[index][1],
            onChanged: (bool? value) {
              onChanged(index, value); // Passe la nouvelle valeur à `onChanged`
            },
          );
        },
      ),
    );
  }
}
