import 'package:equatable/equatable.dart';

import '../model/task.dart';

enum TaskStatus { initial, success, failure }

class TaskState extends Equatable {
  const TaskState({
    this.status = TaskStatus.initial,
    this.tasks = const <Task>[],
    this.hasReachedMax = false,
    this.hasReachedMin = false,
    this.indexOrigin = 25,
    this.startIndex = 50,
    this.endIndex = 70,
  });

  final TaskStatus status;
  final List<Task> tasks;
  final bool hasReachedMax;
  final bool hasReachedMin;
  final int indexOrigin;
  final int startIndex;
  final int endIndex;

  TaskState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
    bool? hasReachedMax,
    bool? hasReachedMin,
    int? indexOrigin,
    int? startIndex,
    int? endIndex,
  }) {
    return TaskState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      hasReachedMin: hasReachedMin ?? this.hasReachedMin,
      indexOrigin: indexOrigin ?? this.indexOrigin,
      startIndex: startIndex ?? this.startIndex,
      endIndex: endIndex ?? this.endIndex,
    );
  }

  @override
  String toString() {
    return '''TaskState { status: $status, hasReachedMax: $hasReachedMax, hasReachedMin: $hasReachedMin, posts: ${tasks.length} }''';
  }

  @override
  List<Object> get props => [status, tasks, hasReachedMax, hasReachedMin];
}
