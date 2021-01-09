import 'package:flutter/material.dart';
import 'package:todos_2/models/task.dart';
import 'package:todos_2/servies/api.dart';

class TodosModel extends ChangeNotifier {
  Api api = Api();
  List<Task> _tasks = [];

  //Fiter List
  List<Task> get allTasks => _tasks;
  List<Task> get incompleteTasks =>
      _tasks.where((todo) => !todo.completed).toList();
  List<Task> get completeTasks =>
      _tasks.where((todo) => todo.completed).toList();

  //Fanctions
  void addTodo(Task task) async {
    var t = await api.addToServer(task);
    print(t);

    _tasks.add(t);
    notifyListeners();
  }

  void addAllTodo() async {
    _tasks = await api.getTask();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    api.deleteFromServer(task.id);
    notifyListeners();
  }

  void toggleTodo(Task task) {
    api.putServer(task, task.id);
    var indexTodo = _tasks.indexOf(task);
    _tasks[indexTodo].toggleCompleted();
    // print(b);

    notifyListeners();
  }
}
