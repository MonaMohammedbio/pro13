
import 'package:flutter/material.dart';

import '../model/Users.dart';
import '../model/task.dart';


class AppViewModel extends ChangeNotifier {

  List<Tasks>  tasks = <Tasks>[];

  User user = User('Ahmed Megahed TodoApp');

  // Model connected with view Model

//method to add task

void addTask ( Tasks newTask ){
  tasks.add(newTask);
  //step
  notifyListeners();
}


void setTaskvalu(int taskindex , bool taskvalu){

  tasks[taskindex].completed = taskvalu;
  notifyListeners();
}

  //  int numbeoftasks(){return tasks.length;}
  int get numberoftasks => tasks.length;


  String get username => user.username;


  int get remaintasks => tasks.where((tasks) => !tasks.completed).length;

  // int remian(){
  //
//  add condtion

  // return !tasks.completed).length;
  // }


String getTaskTile(int taskindex){

  return tasks[taskindex].title;
}

  bool getTaskCpml(int taskindex){

    return tasks[taskindex].completed;
  }


  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }





  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.completed).toList();
    notifyListeners();
  }



  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: ((context) {
        return bottomSheetView;
      }),);
  }
}


