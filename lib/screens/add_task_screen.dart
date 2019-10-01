import 'package:flutter/material.dart';
import 'package:fluttery_todo/models/task.dart';
import 'package:fluttery_todo/models/task_data.dart';
import 'package:fluttery_todo/utils/app_colors.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskDescription;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(35),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: todoPrimaryColor
                ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                taskDescription = newText;
              },
            ),
            FlatButton(
              onPressed: () {
                if(taskDescription != null && taskDescription.isNotEmpty) {
                  Provider.of<TaskData>(context).addTask(
                      Task(name: taskDescription));
                  Navigator.pop(context);
                }
              },
              child: Text("Add", style: TextStyle(color: white, fontSize: 16)),
              color: todoPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
