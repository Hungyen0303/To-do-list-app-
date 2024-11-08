import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'AllTodoList.dart';
import 'BottomSheet.dart';
import 'Search.dart';
import 'TaskBar.dart';
import 'TaskModel.dart';
import 'Today.dart';
import 'Upcoming.dart';
import 'notification_service.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  await flutterLocalNotificationsPlugin.initialize(
    InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),

    ),
  );

  var initialNotification = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  // if (initialNotification?.didNotificationLaunchApp == true) {
  //   Future.delayed(Duration(seconds: 1), () {
  //     navigatorKey.currentState!.pushNamed('/another',
  //         arguments: initialNotification?.notificationResponse?.payload);
  //   });
  // }

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
  void initState() {
    super.initState();
    LocalNotifications.init();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _timeController = TextEditingController();
    TextEditingController _taskController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    final taskModel = Provider.of<TaskModel>(context, listen: false);

    DateTime _parseDueDateTime(String dueDate, String dueTime) {
      final parsedDate = DateFormat('dd/MM/yyyy').parse(dueDate);
      final parsedTime = DateFormat('hh:mm a').parse(dueTime);
      return DateTime(
        parsedDate.year,
        parsedDate.month,
        parsedDate.day,
        parsedTime.hour,
        parsedTime.minute,
      );
    }
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
      // final DateTime dueDateTime = _parseDueDateTime(
      //   _dateController.text,
      //   _timeController.text,
      // );

      // final DateTime notificationTime = dueDateTime.subtract(const Duration(minutes: 10));
      // if (notificationTime.isAfter(DateTime.now())) {
      //   NotificationService.scheduleNotification(
      //     title: 'Upcoming Task',
      //     body: _taskController.text,
      //     scheduledTime: notificationTime,
      //   );
      // }
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


    void sendTestNotification() {
      LocalNotifications.showSimpleNotification(
        title: "Test Notification",
        body: "This is a test notification sent from the button.",
        payload: "Test Payload",
      );
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
      body:
      // Center(
      //   child: ElevatedButton(
      //     onPressed: sendTestNotification,
      //     child: const Text('Send Notification'),
      //   ),
      // ),
      [
        TodoListToday(),
        UpcomingTodoList(),
        AllTodoList(),
        Search(),
      ][currentPageIndex],
    );
  }
}
