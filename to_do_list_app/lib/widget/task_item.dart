import 'package:flutter/material.dart';
import 'package:to_do_list_app/database/db_helper.dart';
import 'package:to_do_list_app/model/db_model.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task, required this.onDelete});
  final Task task;
  final VoidCallback onDelete;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.done == 1;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: () async {
          setState(() {});
          var dbHelper = DbHelper();
          await dbHelper.deleteTask(widget.task.id!);
          widget.onDelete();
        },
        icon: Icon(
          Icons.delete,
          color: Colors.blue,
          size: 30,
        ),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      leading: Transform.scale(
        scale: 1.7, // Adjust the scale value to increase/decrease size
        child: Checkbox(
          side: const BorderSide(width: 0.9),
          shape: const CircleBorder(),
          activeColor: Colors.blue,
          value: isChecked,
          onChanged: (bool? value) async {
            setState(() {
              isChecked = value!;
            });
            var dbHelper = DbHelper();
            await dbHelper.updateTaskDone(widget.task.id!, isChecked ? 1 : 0);
          },
        ),
      ),
      title: Text(
        widget.task.name!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.task.numberDays!),
    );
  }
}
