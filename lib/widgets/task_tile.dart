import 'package:flutter/material.dart';
import 'package:fluttery_todo/utils/app_colors.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final Function checkBoxCallback;

  TaskTile({this.name, this.isChecked, this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
          activeColor: todoPrimaryColor,
          value: isChecked,
          onChanged: checkBoxCallback
      )
    );
  }
}