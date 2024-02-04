import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_list/data_sources/task_data_source.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
