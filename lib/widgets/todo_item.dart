import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_2/models/task.dart';
import 'package:todos_2/providers/todos_model.dart';

class TodoItem extends StatelessWidget {
  final Task task;
  TodoItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      leading: Checkbox(
        value: task.completed,
        onChanged: (checked) {
          Provider.of<TodosModel>(context,listen: false).toggleTodo(task);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Provider.of<TodosModel>(context,listen: false).deleteTodo(task);
          
        },
      ),
    );
  }
}
