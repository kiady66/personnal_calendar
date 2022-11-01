import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:personnal_calendar/view/task_list.dart';

import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => TaskBloc(httpClient: http.Client())
          ..add(TaskTopFetched())
          ..add(TaskFetched()),
        child: const TasksList(),
      ),
    );
  }
}
