import 'package:flutter/material.dart';
import 'package:to_do_list_app/database/db_helper.dart';
import 'package:to_do_list_app/model/db_model.dart';
import 'package:to_do_list_app/widget/task_list.dart';
import 'package:to_do_list_app/widget/text_form.dart';
import 'package:to_do_list_app/widget/time_header.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    var dbHelper = DbHelper();
    List<Map<String, dynamic>> tasks = await dbHelper.getTasks();
    setState(() {
      _tasks = tasks.map((task) => Task.fromMap(task)).toList();
    });
  }

  void _refreshTasks() => _fetchTasks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Tasker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => TaskForm(onTaskAdded: _refreshTasks),
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          DateHeader(),
          Expanded(
            child: TaskList(
              tasks: _tasks,
              onDelete: _refreshTasks,
            ),
          ),
        ],
      ),
    );
  }
}
