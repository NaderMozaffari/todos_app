import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_2/models/data.dart';
import 'package:todos_2/providers/todos_model.dart';
import 'package:todos_2/widgets/list_todo_items.dart';

class Tabs extends StatelessWidget {
  final String tabName;

  Tabs({
    this.tabName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(builder: (context, todo, child) {
        return ListTodoItems(
          tasks: switchTab(todo),
        );
      }),
    );
  }

  switchTab(todo) {
    if (tabName == MyList().allTasks) {
      return todo.allTasks;
    }
    if (tabName == MyList().completeTasks) {
      return todo.completeTasks;
    }
    if (tabName == MyList().incompleteTasks) {
      return todo.incompleteTasks;
    }
  }
}
