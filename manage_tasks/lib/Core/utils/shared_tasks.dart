class SharedTasks {
  static List<Map<String, dynamic>> tasks = [
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

  static List<Map<String, dynamic>> getCompletedTasks() {
    return tasks.where((task) => task['completed'] == true).toList();
  }

  static void addTask(String name, String creator) {
    tasks.add({'name': name, 'creator': creator, 'completed': false});
  }

  static void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
    }
  }

  static void toggleTaskCompletion(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index]['completed'] = !tasks[index]['completed'];
    }
  }
}
