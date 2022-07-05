import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasksno/model/listclass.dart';
import 'addtask.dart';
import 'model/task.dart';

//5 homescreen convert to staless then  remove that depnd on list to provider of this class listclass
class MyHomePage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  //lst tat we add tassks object to it
  //instep3of provider make list in class nofier
  //List<Task> tasks = [Task(name: 'kkkkk', isDone: true)];

  @override
  Widget build(BuildContext context) {
    //var context2 = context;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //context build ,builder funcation that we need container then i make it in externalfile addtask
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            //inside task callbackfuction
            //to put what user indetial when press on floatin action buttonit it open addtaskscreen that take function pass it to the txt button in it
            builder: (context) => AddTask(
                //after step7 add task ues provider of add in classlist not need this function
                /*addTaskCallback: (newTask) {
                //print(newTask);
                setState(() {
                  tasks.add(Task(name: newTask, isDone: true));
                  //then to returnyou in the listv
                  Navigator.pop(context);
                });
              },*/
                ),

            //after make list in external the widget that make all  then in button
          );
        },
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.purple,
      body: Container(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //1 row tomake title our task
              Row(
                children: [
                  Icon(
                    Icons.playlist_add_check,
                    size: 40,
                    color: Colors.white,
                  ),
                  Text(
                    'Our Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                //'${tasks.length} tasks'
                //with provider of class list objects
                //instep 6 go to lisview of task page to use provider like that and remove method callbak ,setstate
                '${Provider.of<TaskList>(context).tasks.length} tasks',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              //to make listview our tasks child of container
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                //listview but put it in external
                child: listvitasks(),
              ))
            ],
          )),
    );
  }
}

////instep 6 go to listview task page to use provider like that and remove method callbak ,setstate
///you can use consumer provider to listen to any vhange instedd of this way
///77 go to 1list class to put add method to add task then go to2 addtask page to to call this method insteed of setstate
///9 checkbox to go to classlistpridel model to add method to to control checkbox then call this method  insted of setstate
class listvitasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //insted of list view us listv.builde  to help us when use button
    /*return ListView(children: [
      listitle(
        taskTitle: tasks[0].name,
        ischecked: tasks[0].isDone,
      )
    ]);*/
    return ListView.builder(
        itemCount: Provider.of<TaskList>(context).tasks.length,
        itemBuilder: (context, index) {
          return listitle(
            taskTitle: Provider.of<TaskList>(context).tasks[index].name,
            ischecked: Provider.of<TaskList>(context).tasks[index].isDone,
            checkboxChange: (newValue) {
              //10
              //Provider.of<TaskList>(context).tasks[index].donechange();
              //method in class model task with notfylistener
              Provider.of<TaskList>(context, listen: false).updatecheck(
                  Provider.of<TaskList>(context, listen: false).tasks[index]);
            },
            //the state that change checkbox
          );
        });
  }
}

//B after make model change it with list of object then pass i
//lidtviewof tasks
/*class listvitasks extends StatefulWidget {
  final List<Task> tasks;

  listvitasks(this.tasks);

  @override
  State<listvitasks> createState() => _listvitasksState();
}

class _listvitasksState extends State<listvitasks> {
  //define it outsde to be able to use it in all places
  //List<Task> tasks = [Task(name: 'kkkkk', isDone: true)];

  @override
  Widget build(BuildContext context) {
    //insted of list view us listv.builde  to help us when use button
    /*return ListView(children: [
      listitle(
        taskTitle: tasks[0].name,
        ischecked: tasks[0].isDone,
      )
    ]);*/
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return listitle(
            taskTitle: widget.tasks[index].name,
            ischecked: widget.tasks[index].isDone,
            checkboxChange: (newValue) {
              setState(() {
                //method in class model task
                widget.tasks[index].donechange();
              });
            },
            //the state that change checkbox
          );
        });
  }
}*/

//c every row in listview
class listitle extends StatelessWidget {
  //make txt varable so we can change it
  final String taskTitle;
  final bool ischecked;
  final void Function(bool?) checkboxChange;
  listitle(
      {required this.taskTitle,
      required this.ischecked,
      required this.checkboxChange});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle),
      //extract check box to external widget to make it atractive
      //trailing: tasskcheck(),
      //to make listtitle and checkbox in same eidgt stless
      trailing: Checkbox(
        activeColor: Colors.purple,
        //chageto is checked to check if true or false
        value: ischecked,
        onChanged: checkboxChange,
      ),
    );
  }
}
/*
class tasskcheck extends StatefulWidget {
  @override
  State<tasskcheck> createState() => _tasskcheckState();
}

class _tasskcheckState extends State<tasskcheck> {
  //const ({ Key? key }) : super(key: key);
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.purple,
      //chageto is checked to check if true or false
      value: ischecked,
      onChanged: (newvalue) {
        //local state because it change this widget not external like global
        setState(() {
          ischecked = newvalue;
        });
      },
    );
  }
}*/

/*
@override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

*/
