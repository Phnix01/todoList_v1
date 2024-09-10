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

  final _textController = TextEditingController();

  void saveNewTask() {
    setState(() {
      toDoList.add([_textController.text, false]);
      _textController.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
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
              onChanged(index, value);
            },
            deleteFunction: (context) {
              deleteTask(index);
            }, // Passe le context pour `Slidable`
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Ajouter une nouvelle tâche',
                  hintFadeDuration: Duration(microseconds: 300),
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
