import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Tasks> tasks = [
    Tasks(task: 'Task1'),
  ];

  int get taskLength {
    return tasks.length;
  }

  void addTask(String? newTask) {
    final task = newTask;
    tasks.add(Tasks(task: task));
    notifyListeners();
  }

  void checkTask(Tasks task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void deleteTask(Tasks task) {
    tasks.remove(task);
    notifyListeners();
  }
}

class Tasks {
  Tasks({this.task, this.isDone = false});

  final String? task;
  bool isDone;
}
// void done() {
//   isDone = !isDone;
// }
