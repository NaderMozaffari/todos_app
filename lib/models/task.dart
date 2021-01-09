import 'package:flutter/material.dart';

class Task {
  String id;
  String title;
  bool completed;
  Task({@required this.title, this.completed = false, this.id});

  void toggleCompleted() {
    completed = !completed;
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
