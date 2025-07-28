import 'package:flutter/material.dart';
import 'package:assignment_3/widgets/modal_tasks.dart';

class TaskCard extends StatelessWidget {
  final Tasks task;
  final int index;

  const TaskCard({required this.task, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 198, 230, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              ReorderableDragStartListener(
                index: index,
                child: const Icon(Icons.menu),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.taskTitle, style: const TextStyle(fontSize: 19)),
                  const SizedBox(height: 5),
                  Text(task.dueDate, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
