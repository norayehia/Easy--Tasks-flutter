import 'package:flutter/material.dart';
import 'home.dart';
import 'package:provider/provider.dart';

import 'model/listclass.dart';

//1in the end after add provider in puplicyml then import it
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//2addrrovider to the  wrap with widgt material becuse it root of tree of ourwidgt
//3 creat (list that take objects that all widgs need to acess to add or view its content)in class inherit provider
    return ChangeNotifierProvider(
      //4 instep put thisclass in materialapp in main
      //5 homescreen convert to staless remove that depnd on list to provider of this class listclass
      create: (context) => TaskList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'tasks',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
