import 'package:assignment_3/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/widgets/modal_tasks.dart';
import 'package:assignment_3/widgets/task_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  final List<Tasks> listOfTasks = [];

  Future<List<Tasks>> fetchTasks() async {
    await Future.delayed(Duration(seconds: 1));
    return listOfTasks;
  }

  Future<void> navigateEditScreen() async {
    final addNewTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddTaskScreen(
              name: 'New Task ',
               buttonName: 'Save'),
      ),
    );
    if (addNewTask != null) {
      setState(() {
        listOfTasks.add(addNewTask);
      });
    }
  }

  Stream<int> taskCount() async* {
    yield listOfTasks.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder(
          stream: taskCount(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading tasks"));
            }
            final tasks = snapshot.data!;
            return Text(
              'Task($tasks)',
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: navigateEditScreen,
              icon: Icon(Icons.add, size: 30),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TaskBuilder(
              futureTasks: fetchTasks(),
              key: ValueKey(listOfTasks.length),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: navigateEditScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
