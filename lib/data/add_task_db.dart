import 'package:hive_flutter/hive_flutter.dart';

part 'add_task_db.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isCompleted;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String priority;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.date,
    required this.priority,
  });

  Task copyWith(
      {String? title,
      String? description,
      bool? isCompleted,
      DateTime? date,
      String? priority}) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      priority: priority ?? this.priority,
    );
  }
}
