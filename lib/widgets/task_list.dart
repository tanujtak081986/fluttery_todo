import 'package:flutter/material.dart';
import 'package:fluttery_todo/models/task_data.dart';
import 'package:fluttery_todo/utils/app_colors.dart';
import 'package:fluttery_todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index) {
          final taskItem = taskData.tasks[index];
          return Dismissible(
            key: ObjectKey(taskItem),
            child: TaskTile(
              name: taskItem.name,
              isChecked: taskItem.isCompleted,
              checkBoxCallback: (newValue) {
                taskData.updateTask(taskItem);
              }
            ),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(Icons.delete,
                  color: white,
                ),
              ),
            ),
            onDismissed: (direction) {
              taskData.deleteTask(taskItem);
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                  content: Text("Task deleted"),
              ));
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}
