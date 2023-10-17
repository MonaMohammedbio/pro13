

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoappround2/view_model/view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Consumer<AppViewModel>(builder: (context , viewModel , child  ){

      return  Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: viewModel.numberoftasks , //opration//
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  //  HapticFeedback.mediumImpact();
                  //   viewModel.deleteTask(index);

                  HapticFeedback.mediumImpact();
                  viewModel.deleteTask(index);
                },
                background: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Icon(Icons.delete, color: Colors.red.shade700)),
                ),  //bacl delet icon
                child: Container(
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(width: 2),
                        checkColor: Colors.cyan,
                        activeColor: Colors.yellow,

                        value: viewModel.getTaskCpml(index) ,
                        // viewModel.getTaskValue(index),
                        onChanged: (value){

                          viewModel.setTaskvalu(index, value!);
                        },

                         //  viewModel.setTaskValue(index, value!);
                        // },
                      ),
                      title: Text(viewModel.getTaskTile(index),
                          style: TextStyle(

                              fontSize: 17,
                              fontWeight: FontWeight.w500))),
                ),
              );
            },
          ))  ;
    })
      ;









  }
}
