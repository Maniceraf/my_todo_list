import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_list/models/task.dart';
import 'package:my_todo_list/providers/task/task_provider.dart';
import 'package:my_todo_list/utils/app_alerts.dart';
import 'package:my_todo_list/utils/extensions.dart';
import 'package:my_todo_list/widgets/common_container.dart';
import 'package:my_todo_list/widgets/task_details.dart';
import 'package:my_todo_list/widgets/task_tile.dart';

class DisplayListOfTasks extends ConsumerWidget {
  final bool isCompletedTasks;
  final List<Task> tasks;

  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksAlert = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to todo!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksAlert,
                style: context.textTheme.headlineSmall,
              ),
            )
          : Container(
              padding: const EdgeInsets.all(15),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: tasks.length,
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, index) {
                  final task = tasks[index];

                  return InkWell(
                    onLongPress: () async {
                      await AppAlerts.showAlertDeleteDialog(
                        context: context,
                        ref: ref,
                        task: task,
                      );
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        },
                      );
                    },
                    child: TaskTile(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          AppAlerts.displaySnackbar(
                            context,
                            task.isCompleted
                                ? 'Task incompleted'
                                : 'Task completed',
                          );
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1.5,
                ),
              ),
            ),
    );
  }
}
