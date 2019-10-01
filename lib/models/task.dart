class Task {
  final String name;
  bool isCompleted;

  Task({this.name, this.isCompleted = false});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}