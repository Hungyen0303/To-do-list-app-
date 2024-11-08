import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'BottomSheet.dart';
import 'TaskModel.dart';
import 'notification_service.dart';

class TaskBar extends StatefulWidget {
  TaskBar({
    super.key,
    required this.task,
    required this.descriptions,
    required this.dueDate,
    required this.dueTime,
    required this.onRemoveTask,
    required this.isDone,
  });

  final String task;
  final String descriptions;
  final String dueTime;
  final String dueDate;
  late final VoidCallback onRemoveTask;
  bool isDone;

  @override
  State<TaskBar> createState() => _TaskbarState();
}

class _TaskbarState extends State<TaskBar> {
  bool _checkBox = false;

  void _scheduleNotification() {
    if (widget.dueTime.isNotEmpty && widget.dueDate.isNotEmpty){
    final DateTime dueDateTime = _parseDueDateTime(widget.dueDate, widget.dueTime);

    if (dueDateTime.isAfter(DateTime.now())) {
      LocalNotifications.showScheduleNotification(
        notificationId: DateTime.now().millisecondsSinceEpoch,
        channel: 'task_notifications',
        title: 'Upcoming Task',
        body: widget.task,
        payload: 'Task: ${widget.task}, Due: ${widget.dueDate} ${widget.dueTime}',
        dueDate: dueDateTime,
      );
    }
    }
  }

  DateTime _parseDueDateTime(String dueDate, String dueTime) {
    final parsedDate = DateFormat('yyyy-MM-dd').parse(dueDate);
    final parsedTime = DateFormat('hh:mm a').parse(dueTime);
    return DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );

  }

  @override
  void initState() {
    super.initState();
    _scheduleNotification();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _timeController = TextEditingController();
    TextEditingController _taskController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    final taskModel = Provider.of<TaskModel>(context, listen: false);
    _dateController.text = widget.dueDate;
    _taskController.text = widget.task;
    _timeController.text = widget.dueTime;
    _descriptionController.text = widget.descriptions;

    void _updateTask(String originalTask, String originalDate, String originalTime) {
      setState(() {
        final taskToRemove = taskModel.tasks.firstWhere(
              (t) => t.task == originalTask && t.dueDate == originalDate && t.dueTime == originalTime,
        );

        if (taskToRemove != null) {
          taskModel.removeTask(taskToRemove);
        }
        taskModel.addTask(
          TaskBar(
            task: _taskController.text,
            descriptions: _descriptionController.text,
            dueDate: _dateController.text,
            dueTime: _timeController.text,
            isDone: false,
            onRemoveTask: () {},
          ),
        );
        _taskController.clear();
        _descriptionController.clear();
        _dateController.clear();
        _timeController.clear();
      });
    }

    void _changeTask() {
      if (_taskController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Task'),
              content: const Text('Please fill out the task field.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
      _updateTask(widget.task, widget.dueDate, widget.dueTime);

      _taskController.clear();
      _descriptionController.clear();
      _dateController.clear();
      _timeController.clear();

      Navigator.pop(context);
    }

    return Card(
      child: ListTile(
        onTap: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return AddTaskBottomSheet(
                taskController: _taskController,
                descriptionController: _descriptionController,
                dateController: _dateController,
                timeController: _timeController,
                onChangeTask: _changeTask,
              );
            },
          );
        },
        trailing: PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'delete') {
              taskModel.removeTask(TaskBar(
                task: widget.task,
                descriptions: widget.descriptions,
                dueDate: widget.dueDate,
                dueTime: widget.dueTime,
                onRemoveTask: () {},
                isDone: widget.isDone,
              ));
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'delete',
              child: Text('Delete Task'),
            ),
          ],
          icon: const Icon(Icons.more_vert),
        ),
        subtitle: Text(
          widget.dueTime + " " + widget.dueDate,
        ),
        leading: Checkbox(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          value: widget.isDone,
          onChanged: (value) {
            setState(() {
              widget.isDone = value ?? false;
            });
          },
        ),
        title: Text(
          widget.task,
          style: TextStyle(
            decoration: widget.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
