import 'package:flutter/material.dart';
import 'package:assignment_3/widgets/modal_tasks.dart';

class AddTaskScreen extends StatefulWidget {
  final Tasks? currentTask;
  final String name;
  final String buttonName;

  const AddTaskScreen({
    super.key,
    this.currentTask,
    required this.buttonName,
    required this.name,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController taskTitleController;
  late TextEditingController descriptionController;
  late TextEditingController duedateController;

  @override
  void initState() {
    super.initState();
    taskTitleController = TextEditingController(
      text: widget.currentTask?.taskTitle ?? '',
    );
    descriptionController = TextEditingController(
      text: widget.currentTask?.description ?? '',
    );
    duedateController = TextEditingController(
      text: widget.currentTask?.dueDate ?? '',
    );
  }

  void addTask() {
    final title = taskTitleController.text;
    final description = descriptionController.text;
    final dueDate = duedateController.text;
    if (title.isNotEmpty) {
      int i = 0;
      i++;
      final newTask = Tasks(
        id: '$i',
        taskTitle: title,
        description: description,
        dueDate: dueDate,
      );
      Navigator.pop(context, newTask);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please Enter Valid Details')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 232, 255),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: taskTitleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              height: (MediaQuery.of(context).size.height) / 4,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 232, 255),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  maxLines: 6,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 232, 255),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: duedateController,
                  decoration: InputDecoration(
                    hintText: "Due Date",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 60),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: addTask,

            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(
              widget.buttonName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
