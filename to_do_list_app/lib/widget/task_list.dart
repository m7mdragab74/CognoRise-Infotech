import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/db_model.dart';
import 'package:to_do_list_app/widget/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? const Center(child: Text('No Tasks Available'))
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              Task task = tasks[index];
              return TaskItem(task: task);
            },
          );
  }
}
