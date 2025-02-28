import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/application/pages/home/details/text_details_page.dart';
import 'package:to_do/application/pages/home/home_riverpod/task_state.dart';
import 'package:to_do/application/pages/home/home_screen/text_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const TextScreen();
          }));
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
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TextDetailsPage(
                                // task: task,
                                // index: index,
                                );
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref.read(taskProvider.notifier).deleteTask(index);
                          },
                        ),
                        title: Text(task.title),
                        subtitle: Text(
                          task.date.toString(),
                        ),
                        trailing: Checkbox(
                          value: task.isCompleted,
                          onChanged: (_) {
                            ref
                                .read(taskProvider.notifier)
                                .toggleTaskCompletion(index);
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
