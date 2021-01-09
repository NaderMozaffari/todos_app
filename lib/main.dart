import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_2/providers/todos_model.dart';
import 'package:todos_2/screens/home.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosModel(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
