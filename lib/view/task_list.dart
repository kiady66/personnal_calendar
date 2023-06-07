import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task/task_bloc.dart';
import '../bloc/task/task_event.dart';
import '../bloc/task/task_state.dart';
import 'package:infinite_listview/infinite_listview.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        switch (state.status) {
          case TaskStatus.failure:
            return const Center(child: Text('failed to fetch tasks'));
          case TaskStatus.success:
            if (state.tasks.isEmpty) {
              return const Center(child: Text('no tasks'));
            }
            return InfiniteListView.separated(
              itemBuilder: (BuildContext context, int index) {
                if ((state.indexOrigin + index) <= 2) {
                  context.read<TaskBloc>().add(TaskTopFetched());
                }
                print(state.indexOrigin + index);
                if (state.indexOrigin + index >= state.tasks.length - 1) {
                  context.read<TaskBloc>().add(TaskFetched());
                }
                return Container();
              },
              controller: _infiniteController,
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 2.0),
              anchor: 0.5,
            );
          case TaskStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _infiniteController.dispose();
    super.dispose();
  }

/*  void _onScroll() {
    if (_isBottom) context.read<TaskBloc>().add(TaskFetched());
    if (_isTop) context.read<TaskBloc>().add(TaskTopFetched());
    if (_isTop) print("top");

    // TODO: if _isTop put element on top
    // https://stackoverflow.com/questions/51812204/in-flutter-how-can-i-make-a-list-view-which-is-infinite-both-to-the-top-and-to
    // https://pub.dev/packages/infinite_listview
  }*/

  bool get _isBottom {
    if (!_infiniteController.hasClients) return false;
    final maxScroll = _infiniteController.position.maxScrollExtent;
    final currentScroll = _infiniteController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isTop {
    if (!_infiniteController.hasClients) return false;
    final minScroll = _infiniteController.position.minScrollExtent;
    final currentScroll = _infiniteController.offset;
    return currentScroll <= (minScroll * 100);
  }
}
