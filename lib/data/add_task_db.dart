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

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  Task copyWith({String? title, String? description, bool? isCompleted}) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
