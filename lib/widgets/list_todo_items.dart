import 'package:flutter/material.dart';
import 'package:todos_2/models/task.dart';
import 'package:todos_2/widgets/todo_item.dart';

class ListTodoItems extends StatelessWidget {
  final List<Task> tasks;
  ListTodoItems({this.tasks});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenItems(),
    );
  }

  List<Widget> getChildrenItems() {
    return tasks.map((todo) => TodoItem(task: todo)).toList();
  }
}
