import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../view/task_list.dart';
import '../home_page/components/top_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: TopCalendar(),
        ),
        Expanded(
          flex: 3,
          child: BlocProvider(
            create: (_) => TaskBloc(httpClient: http.Client())..add(TaskFetched()),
            child: const TasksList(),
          ),
        )
      ],
    );
  }
}
