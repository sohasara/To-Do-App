import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:to_do/application/pages/home/home_riverpod/task_state.dart';

import '../home/details/text_details_page.dart';

class CompTask extends ConsumerWidget {
  const CompTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTasks =
        ref.watch(taskProvider).where((task) => task.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
        title: const Text(
          'Completed Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: completedTasks.isEmpty
          ? const Center(child: Text("No completed tasks yet!"))
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];
                final formattedDate =
                    DateFormat('dd-MM-yyyy').format(task.date);

                return Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextDetailsPage(
                            index: index,
                            tittle: task.title,
                            description: task.description,
                            dateF: formattedDate,
                            priority: task.priority,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          task.title,
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.shade700,
                          ),
                          onPressed: () {
                            final fullIndex =
                                ref.read(taskProvider).indexOf(task);
                            ref
                                .read(taskProvider.notifier)
                                .deleteTask(fullIndex);
                          },
                        ),
                        subtitle: Text('Finishing Date: $formattedDate'),
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (_) {
                            final fullIndex =
                                ref.read(taskProvider).indexOf(task);
                            ref
                                .read(taskProvider.notifier)
                                .toggleTaskCompletion(fullIndex);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
