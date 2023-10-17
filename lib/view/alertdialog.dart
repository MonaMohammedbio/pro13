

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappround2/model/task.dart';
import 'package:todoappround2/view_model/view_model.dart';

class AlertshowDialog extends StatelessWidget {
  final TextEditingController entryController = TextEditingController();

   AlertshowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return

    Consumer<AppViewModel>(builder:  (context , viewModel ,child){

      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Add your Taks.'),
              //
              TextField(
                onSubmitted: (value) {
                  if (entryController.text.isNotEmpty) {
                    //   Task newTask = Task(entryController.text, false);
                    //   viewModel.addTask(newTask);


                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    filled: true,
                    //   fillColor: viewModel.clrLvl2,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,

                autofocus: true,
                autocorrect: false,
                controller: entryController,
                style: TextStyle(
                    fontWeight: FontWeight.w500),
              ),


              //

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Save'),
            onPressed: () {

              Tasks newTask = Tasks(entryController.text, false);
              viewModel.addTask(newTask);
              entryController.clear();
              Navigator.of(context).pop();
            },
          ),

        ],
      )  ;

    }     )

      ;
  }
}
