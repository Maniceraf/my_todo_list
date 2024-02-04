import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_list/providers/task/task_notifier.dart';
import 'package:my_todo_list/providers/task/task_state.dart';
import 'package:my_todo_list/repositories/task_repository_provider.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
