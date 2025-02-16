import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Provider for managing priority selection
final priorityProvider = StateProvider<String>((ref) => 'medium');

class TextScreen extends ConsumerWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPriority = ref.watch(priorityProvider);

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Add Your Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Task Title',
                labelStyle: TextStyle(color: Colors.indigo.shade700),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.indigo.shade700),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.indigo),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            const Text(
              'Priority',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['high', 'medium', 'low'].map((priority) {
                return ChoiceChip(
                  label: Text(priority.toUpperCase()),
                  selected: selectedPriority == priority,
                  selectedColor: Colors.indigo.shade400,
                  backgroundColor: Colors.grey.shade300,
                  labelStyle: TextStyle(
                    color: selectedPriority == priority
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (selected) {
                    ref.read(priorityProvider.notifier).state = priority;
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                onPressed: () {
                  // You can use ref.read(priorityProvider) to get the selected value
                  debugPrint(
                      "Selected Priority: ${ref.read(priorityProvider)}");
                },
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
