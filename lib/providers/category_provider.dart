import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_list/utils/task_category.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.others;
});
