import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AllTodoList.dart';
import 'BottomSheet.dart';
import 'Search.dart';
import 'TaskBar.dart';
import 'TaskModel.dart';
import 'Today.dart';
import 'Upcoming.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titles = ["Today", "Upcoming", 'All', 'Search'];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _timeController = TextEditingController();
    TextEditingController _taskController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    final taskModel = Provider.of<TaskModel>(context, listen: false);

    void _createTask() {
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

      setState(() {
        taskModel.addTask(
          TaskBar(
            task: _taskController.text,
            descriptions: _descriptionController.text,
            dueDate: _dateController.text,
            dueTime: _timeController.text,
            isDone: false,
            onRemoveTask: () {

            },
          ),
        );
      });

      _taskController.clear();
      _descriptionController.clear();
      _dateController.clear();
      _timeController.clear();

      Navigator.pop(context);
    }





    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentPageIndex],
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return AddTaskBottomSheet(
                taskController: _taskController,
                descriptionController: _descriptionController,
                dateController: _dateController,
                timeController: _timeController,
                onChangeTask: _createTask,


              );
            },
          );

        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            label: 'Today',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.event)),
            label: 'Upcoming',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'All',
          ),
          NavigationDestination(
            icon: Icon(Icons.messenger_sharp),
            label: 'Search',
          ),
        ],
      ),
      body: [
        TodoListToday(),
        UpcomingTodoList(),
        AllTodoList(),
        Search(),
      ][currentPageIndex],
    );
  }
}
