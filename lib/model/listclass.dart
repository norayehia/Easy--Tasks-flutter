import 'package:flutter/foundation.dart';
import 'package:tasksno/model/task.dart';

//instep3of provider make list in class nofier
//4 instep put thisclass in materialapp in main

///77 go to 1list class to put add method to add task then go to2 addtask page to to call this method insteed of setstate
///9 checkbox to go to classlistpridel model to add method to to control checkbox then call this method  insted of setstate
class TaskList extends ChangeNotifier {
  List<Task> tasks = [Task(name: 'I will finish my home work')];

  void addTask(String newdata) {
    tasks.add(Task(name: newdata));
    notifyListeners();
  }

  void updatecheck(Task task) {
    //in taskmodel we define this method use it with it
    task.donechange();

    notifyListeners();
  }
}
//10 then go to home to call this funtion in checkbox
