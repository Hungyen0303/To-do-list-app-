import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'TaskBar.dart';
import 'TaskModel.dart';

class UpcomingTodoList extends StatelessWidget {
  const UpcomingTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, taskModel, child) {
        return ListView.builder(
          itemCount: taskModel.tasks.length,
          itemBuilder: (context, index)
          {
            final task = taskModel.tasks[index];
            final today = DateTime.now();

            if (task.dueDate.isNotEmpty){
            final dueDate = DateFormat('yyyy-MM-dd').parse(task.dueDate);

            if (task.dueDate.isNotEmpty && dueDate.isAfter(today) && task.dueDate!=""  ) {
              return task;
            }
            else {
              return const SizedBox.shrink();
            }
            }
            else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
