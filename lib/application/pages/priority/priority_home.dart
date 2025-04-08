import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/home_riverpod/task_state.dart';

class PriorityHome extends ConsumerWidget {
  const PriorityHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskProvider);

    final highPriority =
        allTasks.where((task) => task.priority == 'High').toList();
    final mediumPriority =
        allTasks.where((task) => task.priority == 'Medium').toList();
    final lowPriority =
        allTasks.where((task) => task.priority == 'Low').toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
        title: const Text(
          'Priority Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "High Priority Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
