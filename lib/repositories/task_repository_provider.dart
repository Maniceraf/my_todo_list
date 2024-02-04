import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_list/data_sources/task_data_source_provider.dart';
import 'package:my_todo_list/repositories/task_repository.dart';
import 'package:my_todo_list/repositories/task_repository_impl.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.read(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
