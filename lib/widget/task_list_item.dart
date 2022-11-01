import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: Text('${task.id}'),
        title: Text(task.title),
        isThreeLine: true,
        subtitle: Text(task.body),
        dense: true,
      ),
    );
  }
}
