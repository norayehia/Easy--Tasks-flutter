import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasksno/model/listclass.dart';

///77 go to 1list class to put add method to add task then go to2 addtask page to to call this method insteed of setstate
class AddTask extends StatelessWidget {
  //const AddTask({Key? key}) : super(key: key);
  //define funcation when put task
  //final Function addTaskCallback;

  //AddTask({Key? key, required this.addTaskCallback}) : super(key: key);
  String? newtask;
  @override
  Widget build(BuildContext context) {
    //inside container column(txt,txtfield,button)
    return Container(
      child: Column(children: [
        Text(
          'Add Tasks',
          style: TextStyle(
              color: Colors.purple, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          // to get new txt from
          child: TextField(
            onChanged: (newtxt) {
              newtask = newtxt;
            },
            //obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'task',
              hintText: 'Enter your task here',
            ),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              //addTaskCallback(newtask);

              Provider.of<TaskList>(context, listen: false).addTask(newtask!);
              Navigator.pop(context);
            },
            child: Text('Add Task',
                style: TextStyle(
                  color: Colors.white,
                )))
      ]),
    );
  }
}

////instep 6 go in home to  listview task page to use provider like that and remove method callbak ,setstate

/*class AddTask extends StatelessWidget {
  //const AddTask({Key? key}) : super(key: key);
  //define funcation when put task
  final Function addTaskCallback;

  AddTask({Key? key, required this.addTaskCallback}) : super(key: key);
  String? newtask;
  @override
  Widget build(BuildContext context) {
    //inside container column(txt,txtfield,button)
    return Container(
      child: Column(children: [
        Text(
          'Add Tasks',
          style: TextStyle(
              color: Colors.purple, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          // to get new txt from
          child: TextField(
            onChanged: (newtxt) {
              newtask = newtxt;
            },
            //obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'task',
              hintText: 'Enter your task here',
            ),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              addTaskCallback(newtask);
            },
            child: Text('Add Task',
                style: TextStyle(
                  color: Colors.white,
                )))
      ]),
    );
  }
}*/
