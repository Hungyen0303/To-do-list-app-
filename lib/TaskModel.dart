import 'package:flutter/material.dart';
import 'package:todolistapp/TaskBar.dart';
import 'package:todolistapp/helper/datetime.dart';

class TaskModel extends ChangeNotifier {
  String query = '@#@';
   DateTimeHelper dateTimeHelper = DateTimeHelper();




  List<TaskBar> tasks = [
    TaskBar(task: "Learn React.js",
        descriptions: "Learn useState",
        dueDate: DateTimeHelper.getTodayAsString(),
        dueTime: DateTimeHelper.getSomeTimeAsString(1),
        onRemoveTask: (){},
        isDone: false) ,
    TaskBar(task: "Learn Node.js",
        descriptions: "Learn Express",
        dueDate: DateTimeHelper.getTodayAsString(),
        dueTime: DateTimeHelper.getSomeTimeAsString(100),
        onRemoveTask: (){},
        isDone: false) ,
    TaskBar(task: "Learn Git.js",
        descriptions: "Learn flow",
        dueDate: DateTimeHelper.getSomeNextDay(5),
        dueTime: DateTimeHelper.getSomeTimeAsString(11),
        onRemoveTask: (){},
        isDone: false) ,
    TaskBar(
      task: 'Do homework',
      descriptions: 'Complete math homework by 10 PM',
      dueDate: '2024-01-01',
      dueTime: '10:00',
      isDone: false,
      onRemoveTask: () {},
    ),
    TaskBar(
      task: 'Do homework',
      descriptions: 'Complete math homework by 10 PM',
      dueDate: '2024-11-08',
      dueTime: '11:48',
      isDone: false,
      onRemoveTask: () {},
    ),
    TaskBar(
      task: 'Do homework',
      descriptions: 'Complete math homework by 10 PM',
      dueDate: '2024-11-08',
      dueTime: '11:52',
      isDone: false,
      onRemoveTask: () {},
    ),
    TaskBar(
      task: 'Buy groceries',
      descriptions: 'Pick up eggs, milk, and bread',
      dueDate: '2024-11-08',
      isDone: false,
      dueTime: '2:00',
      onRemoveTask: () {},
    ),
    TaskBar(
      task: 'Clean the house',
      descriptions: 'Vacuum the living room and clean the kitchen',
      dueDate: '2024-11-09',
      isDone: false,
      dueTime: '1:00',
      onRemoveTask: () {},
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
    tasks.removeWhere((item) =>
    item.task == task.task && item.dueDate == task.dueDate);
    notifyListeners();
  }

}
