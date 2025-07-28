import 'package:assignment_3/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/widgets/modal_tasks.dart';
import 'package:assignment_3/screens/tasks_screen.dart';

class TaskBuilder extends StatefulWidget {
  final Future<List<Tasks>> futureTasks;
  const TaskBuilder({required this.futureTasks, super.key});

  @override
  State<TaskBuilder> createState() => _TaskBuilderState();
}

class _TaskBuilderState extends State<TaskBuilder> {
  List<Tasks> taskListDummy = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tasks>>(
      future: widget.futureTasks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('No tasks yet'));
        }

        if (taskListDummy.isEmpty && snapshot.hasData) {
          taskListDummy = snapshot.data!;
        }

        return Expanded(
          child: ReorderableListView.builder(
            itemCount: taskListDummy.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final task = taskListDummy.removeAt(oldIndex);
                taskListDummy.insert(newIndex, task);
              });
            },
            itemBuilder: (context, index) {
              final task = taskListDummy[index];
              return Container(
                key: ValueKey(index),
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  onTap: () async {
                    final updatedTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTaskScreen(
                          currentTask: task,
                          name: 'Edit Task',
                          buttonName: 'Update',
                        ),
                      ),
                    );
                    if (updatedTask != null) {
                      setState(() {
                        taskListDummy[index] = updatedTask;
                      });
                    }
                  },
                  child: TaskCard(task: task, index: index),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
