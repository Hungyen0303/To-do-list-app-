


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListToday extends StatefulWidget
{
  const TodoListToday({super.key});

  
  @override
  State<TodoListToday> createState() => _TodoListTodayState();
}

class _TodoListTodayState extends State<TodoListToday>
{

  bool _isChecked = false;
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  void  _checkBox()
  {

  }

  void palaceholder()  {

  }

   List<Widget> listTask = [
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),   Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),
     Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),   Card(
       child: ListTile(
         trailing: IconButton(onPressed: () =>
         {

         }, icon: Icon(Icons.more_vert)),
         subtitle: Text('Here is a second line'),
         leading: Checkbox(value: false, onChanged : (value) {
         },),
         title: const Text('One-line with leading widget'),
       ),
     ),



     

   ];
  
  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(
            padding: EdgeInsets.all(5.0)  ,
            child:Text(
                  today ,
                  style: const TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
        ),) ),

        const Divider(
          height: 2,
          thickness: 1,
        ),
        Expanded(child:
        ListView(
          scrollDirection: Axis.vertical,
          children: listTask.map((task) => task).toList() ,),)

      ]

    );
  }
  
}