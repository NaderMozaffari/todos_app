import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_2/models/data.dart';
import 'package:todos_2/models/task.dart';
import 'package:todos_2/providers/todos_model.dart';
import 'package:todos_2/screens/add_todo.dart';
import 'package:todos_2/servies/api.dart';
import 'package:todos_2/widgets/tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;



  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    
    Provider.of<TodosModel>(context, listen: false).addAllTodo();

  }

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTodoScreen()),
                );
              })
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: MyList().allTasks),
            Tab(text: MyList().completeTasks),
            Tab(text: MyList().incompleteTasks),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Tabs(tabName: MyList().allTasks),
          Tabs(tabName: MyList().completeTasks),
          Tabs(tabName: MyList().incompleteTasks),
        ],
      ),
    );
  }
}
