import 'package:flutter/material.dart';
import 'package:fluttery_todo/screens/tasks_screen.dart';
import 'package:fluttery_todo/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      builder: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
        theme: ThemeData(
          accentColor: todoPrimaryColor,
          primaryColor: todoPrimaryColor,
          cursorColor: todoPrimaryColor,
          textSelectionHandleColor: todoPrimaryColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: todoPrimaryColor,
            foregroundColor: white
          )
        )
      ),
    );
  }
}
