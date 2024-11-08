import 'package:flutter/material.dart';
import 'package:todolistapp/TaskBar.dart';

class TaskModel extends ChangeNotifier {
  String query = '@#@';

  List<TaskBar> tasks = [
    TaskBar(
      task: 'Do homework',
      descriptions: 'Complete math homework by 10 PM',
      dueDate: '2024-11-07',
      dueTime: '10:00 PM',
      isDone: false,
      onRemoveTask: () {

      },
    ),
    TaskBar(
      task: 'Buy groceries',
      descriptions: 'Pick up eggs, milk, and bread',
      dueDate: '2024-11-08',
      isDone: false,
      dueTime: '2:00 PM',
      onRemoveTask: () {
      },
    ),
    TaskBar(
      task: 'Clean the house',
      descriptions: 'Vacuum the living room and clean the kitchen',
      dueDate: '2024-11-09',
      isDone: false,
      dueTime: '1:00 PM',
      onRemoveTask: () {
      },
    ),
  ];

  List<TaskBar> get filteredTasks {
    return tasks.where((task) {
      return task.task.toLowerCase().contains(query.toLowerCase()) ||
          task.descriptions.toLowerCase().contains(query.toLowerCase()) ||
          task.dueDate.contains(query) ||
          task.dueTime.contains(query);
    }).toList();

  }
  void updateQuery(String newQuery) {
    query = newQuery;
    notifyListeners();
  }
  void addTask(TaskBar task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(TaskBar task) {
    tasks.remove(task);
    notifyListeners();
  }
}
