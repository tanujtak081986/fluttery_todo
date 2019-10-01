import 'package:flutter/material.dart';
import 'package:fluttery_todo/models/task_data.dart';
import 'package:fluttery_todo/utils/app_colors.dart';
import 'package:fluttery_todo/widgets/task_list.dart';
import 'package:fluttery_todo/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: todoPrimaryColor,
      floatingActionButton: buildFloatingActionButton(context),
      body: buildTaskScreenContainer(),
    );
  }

  Column buildTaskScreenContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildHeaderView(),
        //Container for tasks list
        buildTaskListView()
      ],
    );
  }

  Container buildHeaderView() {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTodoIcon(),
          SizedBox(height: 15),
          buildTodoTitle("Todo app"),
          Builder(
            builder: (context) {
              return buildTodoTaskCounter("${Provider.of<TaskData>(context).taskCount} Tasks");
            },
          )
        ],
      ),
    );
  }

  Expanded buildTaskListView() {
    return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 300,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: TaskList(),
        ),
      );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
      },
    );
  }

  Widget buildTodoIcon() {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 30,
      child: Icon(
        Icons.list,
        size: 30,
        color: todoPrimaryColor,
      ),
    );
  }

  Widget buildTodoTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w700,
        color: white
      ),
    );
  }

  Widget buildTodoTaskCounter(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20,
          color: white
      ),
    );
  }
}
