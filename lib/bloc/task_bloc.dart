import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:http/http.dart' as http;
import 'package:personnal_calendar/bloc/task_event.dart';
import 'package:personnal_calendar/bloc/task_state.dart';

import '../model/task.dart';

const _taskLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required this.httpClient}) : super(const TaskState()) {
    on<TaskFetched>(
      _onTaskFetched,
      transformer: throttleDroppable(throttleDuration),
    );

    on<TaskTopFetched>(
      _onTaskTopFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onTaskTopFetched(TaskTopFetched event, Emitter<TaskState> emit) async {
    if (state.hasReachedMin) return;
    try {
      final tasks = await _fetchTasks(state.startIndex - 20, 20);
      tasks.isEmpty
          ? emit(state.copyWith(hasReachedMin: true))
          : emit(
              state.copyWith(
                status: TaskStatus.success,
                tasks: List.of(state.tasks)..insertAll(0, tasks),
                hasReachedMax: false,
                hasReachedMin: false,
                indexOrigin: state.indexOrigin + 20,
                startIndex: state.startIndex - 20,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: TaskStatus.failure));
    }
  }

  Future<void> _onTaskFetched(
    TaskFetched event,
    Emitter<TaskState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == TaskStatus.initial) {
        final tasks = await _fetchTasks(state.startIndex, state.endIndex);
        return emit(
          state.copyWith(status: TaskStatus.success, tasks: tasks, hasReachedMax: false, hasReachedMin: false, indexOrigin: 25),
        );
      }
      final tasks = await _fetchTasks(state.endIndex, 20);
      tasks.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: TaskStatus.success,
                tasks: List.of(state.tasks)..addAll(tasks),
                hasReachedMax: false,
                endIndex: state.endIndex + 20,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: TaskStatus.failure));
    }
  }

  Future<List<Task>> _fetchTasks([int startIndex = 0, int endIndex = 100]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$endIndex'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Task(
          id: map['id'] as int,
          title: map['title'] as String,
          body: map['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching tasks');
  }
}
