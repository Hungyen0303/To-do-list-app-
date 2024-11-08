import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'TaskBar.dart';
import 'TaskModel.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search tasks...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              Provider.of<TaskModel>(context, listen: false).updateQuery(value);
            },
          ),
        ),

        Consumer<TaskModel>(
          builder: (context, taskModel, child) {
            final tasks = taskModel.filteredTasks;

            if (tasks.isEmpty) {
              return const Center(child: Text('No tasks found.'));
            }

            return Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return task;
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
