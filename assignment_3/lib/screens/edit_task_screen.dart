import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(
          'Edit Task ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! title start
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 232, 255),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Task Name ",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //! description start
            Container(
              height: (MediaQuery.of(context).size.height) / 4,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 232, 255),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(
              'Save',
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
