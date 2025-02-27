import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/data/add_task_db.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  late Box<Task> _taskBox;

  TaskNotifier() : super([]) {
    _initHive();
  }

  /// Initialize Hive and load stored tasks
  Future<void> _initHive() async {
    _taskBox = await Hive.openBox<Task>('tasks');
    state = _taskBox.values.toList();
  }

  /// Add a new task with priority and date
  void addTask(
      String title, String description, DateTime date, String priority) {
    if (title.isNotEmpty && description.isNotEmpty) {
      final newTask = Task(
          title: title,
          description: description,
          date: date,
          priority: priority);
      _taskBox.add(newTask); // Store in Hive
      state = [...state, newTask]; // Update Riverpod state
    }
  }

  /// Toggle task completion status
  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < state.length) {
      final updatedTask =
          state[index].copyWith(isCompleted: !state[index].isCompleted);
      _taskBox.putAt(index, updatedTask); // Update Hive
      state = [...state]..[index] = updatedTask; // Update Riverpod state
    }
  }

  /// Delete a task
  void deleteTask(int index) {
    if (index >= 0 && index < state.length) {
      _taskBox.deleteAt(index); // Remove from Hive
      state = [...state]..removeAt(index); // Update Riverpod state
    }
  }
}
