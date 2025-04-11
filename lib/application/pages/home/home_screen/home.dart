import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:to_do/application/pages/home/details/text_details_page.dart';
import 'package:to_do/application/pages/home/home_riverpod/task_state.dart';
import 'package:to_do/application/pages/home/home_screen/drawer.dart';
import 'package:to_do/application/pages/home/home_screen/text_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks =
        ref.watch(taskProvider).where((task) => !task.isCompleted).toList();

    return Scaffold(
      drawer: const Drawer(
        child: DrawerPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TextScreen(),
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.indigo.shade300,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        centerTitle: true,
        title: const Text(
          'To Do App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text("No tasks added yet!"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
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
                        title: Text(
                          task.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
