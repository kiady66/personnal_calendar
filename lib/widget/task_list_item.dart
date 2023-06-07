import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskListItem extends StatelessWidget {
  int id;

  String title;

  String description;

  TaskListItem({super.key, required this.id, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: Text('$id'),
        title: Text(title),
        isThreeLine: true,
        subtitle: Text(description),
        dense: true,
      ),
    );
  }
}
