import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskFetched extends TaskEvent {}

class TaskTopFetched extends TaskEvent {}
