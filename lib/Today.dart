import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'TaskBar.dart';
import 'TaskModel.dart';

class TodoListToday extends StatelessWidget {
  const TodoListToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, taskModel, child) {
        return ListView.builder(
            itemCount: taskModel.tasks.length,
            itemBuilder: (context, index)
        {
            final task = taskModel.tasks[index];
            final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

            if (task.dueDate == today) {
              return task;
        } else {
          return const SizedBox.shrink();
        }
      },
        );
      },
    );
  }
}
