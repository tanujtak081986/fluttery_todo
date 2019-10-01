import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttery_todo/models/task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Sample task 1"),
    Task(name: "Sample task 2")
  ];

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleCompleted();
    notifyListeners();
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
}