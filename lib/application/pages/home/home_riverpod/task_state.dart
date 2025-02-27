import 'package:flutter_riverpod/flutter_riverpod.dart';

class Task {
  final String title;
  final String description;
  final bool isCompleted;

  Task(
      {required this.title,
      required this.description,
      this.isCompleted = false});

  Task copyWith({String? title, String? description, bool? isCompleted}) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      state = [...state, Task(title: title, description: description)];
    }
  }

  void toggleTaskCompletion(int index) {
    state = state.asMap().entries.map((entry) {
      final i = entry.key;
      final task = entry.value;
      return i == index ? task.copyWith(isCompleted: !task.isCompleted) : task;
    }).toList();
  }
}
