import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/add_task_db.dart';
import '../home/home_riverpod/task_state.dart';

class PriorityHome extends ConsumerWidget {
  const PriorityHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskProvider);

    final high =
        allTasks.where((t) => t.priority.toLowerCase() == 'high').toList();
    final medium =
        allTasks.where((t) => t.priority.toLowerCase() == 'medium').toList();
    final low =
        allTasks.where((t) => t.priority.toLowerCase() == 'low').toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
        title: const Text(
          'Priority Tasks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          if (high.isNotEmpty)
            _buildSection('High Priority', high, Colors.red, ref),
          if (medium.isNotEmpty)
            _buildSection('Medium Priority', medium, Colors.orange, ref),
          if (low.isNotEmpty)
            _buildSection('Low Priority', low, Colors.green, ref),
          if (allTasks.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No tasks added yet.'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSection(
      String title, List<Task> tasks, Color color, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        ...tasks.map(
          (task) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Finishing Date: ${_formatDate(task.date)}'),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      final fullIndex = ref.read(taskProvider).indexOf(task);
                      ref
                          .read(taskProvider.notifier)
                          .toggleTaskCompletion(fullIndex);
                    },
                  ),
                  Icon(
                    Icons.flag,
                    color: color,
                    size: 20,
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red.shade700),
                onPressed: () {
                  final fullIndex = ref.read(taskProvider).indexOf(task);
                  ref.read(taskProvider.notifier).deleteTask(fullIndex);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
