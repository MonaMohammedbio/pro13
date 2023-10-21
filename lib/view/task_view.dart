

import 'package:flutter/material.dart';
import 'package:todoappround2/model/Todo.dart';
import 'package:todoappround2/model/service.dart';

import 'AddTask.dart';
import 'header_view.dart';
import 'task_list_view.dart';
import 'taskinfo.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late Future<Todo> futureTodo;

  @override
  void initState() {
    super.initState();
  futureTodo = fetchTodo();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

            Expanded(flex: 1,
                child: HeaderView()),
            Expanded(flex: 1,
                child: TaskInfoView()),
            Expanded(flex: 7,
                child:TaskListView()),
            FutureBuilder<Todo>(
              future: futureTodo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )

          ],
        ),

      ),
      floatingActionButton: AddTask(),  //create widget
    );
  }
}
