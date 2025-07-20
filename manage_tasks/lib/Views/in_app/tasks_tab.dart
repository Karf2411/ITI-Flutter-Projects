import 'package:flutter/material.dart';
import 'package:manage_tasks/Core/widgets/custom_text_field.dart';

import '../../Core/utils/cash_helper.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final TextEditingController taskController = TextEditingController();
  List<Map<String, dynamic>> tasks = [
    {'name': 'Grocery Shopping', 'creator': 'Ethan Carter', 'completed': false},
    {
      'name': 'Book Appointment',
      'creator': 'Olivia Bennett',
      'completed': false,
    },
    {'name': 'Pay Bills', 'creator': 'Noah Thompson', 'completed': false},
    {'name': 'Plan Vacation', 'creator': 'Sophia Clark', 'completed': false},
    {'name': 'Gym Workout', 'creator': 'Liam Walker', 'completed': false},
    {'name': 'Read Book', 'creator': 'Ava Harris', 'completed': false},
    {'name': 'Learn New Skill', 'creator': 'Caleb Foster', 'completed': false},
  ];

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({
          'name': taskController.text,
          'creator': CacheHelper.getDataSync(key: 'firstName')!,
          'completed': false,
        });
        taskController.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a2332),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Input field
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2B3840),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF34495E)),
              ),
              child: CustomTextField(
                controller: taskController,
                hintText: 'Enter Task Name',
              ),
            ),
            const SizedBox(height: 16),
            // Add Task Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00FF00),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Tasks Title
            const Text(
              'Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Tasks List
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B3840),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF34495E)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[index]['name']!,
                                style: TextStyle(
                                  color: tasks[index]['completed']
                                      ? Colors.grey[400]
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  decoration: tasks[index]['completed']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Created by: ${tasks[index]['creator']!}',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            tasks[index]['completed']
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: tasks[index]['completed']
                                ? Colors.green
                                : Colors.white,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () => deleteTask(index),
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
