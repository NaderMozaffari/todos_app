import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_2/models/task.dart';
import 'package:todos_2/providers/todos_model.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  var textTitleController = TextEditingController();
  Task task;
  @override
  void initState() {
    super.initState();
    task = Task(title: 'dsf', completed: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: textTitleController,
            ),
            CheckboxListTile(
              title: Text('Complete ?'),
              value: task.completed,
              onChanged: (checked) {
                setState(() {
                  task.completed = checked;
                });
              },
            ),
            RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Add to todo list'), Icon(Icons.add)],
              ),
              onPressed: () {
                task = Task(
                    title: textTitleController.text, completed: task.completed);
                var value = textTitleController.text;
                if (value.isNotEmpty) {
                  Provider.of<TodosModel>(context, listen: false).addTodo(task);
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
