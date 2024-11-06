


import 'package:flutter/material.dart';

class TodoListToday extends StatefulWidget
{
  const TodoListToday({super.key});

  
  @override
  State<TodoListToday> createState() => _TodoListTodayState();
}

class _TodoListTodayState extends State<TodoListToday>
{

  bool _isChecked = false;

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
    return Scaffold(
      //appBar:
      body:
      ListView

        (
        scrollDirection: Axis.vertical,
        children: listTask.map((task) => task).toList() ,

      ),
    );
  }
  
}