// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'home_riverpod/task_state.dart';
// import 'home_riverpod/text_area_state.dart';

// class TextScreen extends ConsumerWidget {
//   const TextScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final taskController =
//         TextEditingController(text: ref.watch(taskTitleProvider));
//     final descriptionController =
//         TextEditingController(text: ref.watch(taskDescriptionProvider));
//     final selectedPriority = ref.watch(priorityProvider);

//     return Scaffold(
//       backgroundColor: Colors.indigo.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.indigo.shade300,
//         centerTitle: true,
//         title: const Text(
//           "Add Your Task",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: taskController,
//               onChanged: (value) =>
//                   ref.read(taskTitleProvider.notifier).state = value,
//               decoration: InputDecoration(
//                 labelText: 'Task Title',
//                 labelStyle: TextStyle(color: Colors.indigo.shade900),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.indigo),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: descriptionController,
//               onChanged: (value) =>
//                   ref.read(taskDescriptionProvider.notifier).state = value,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 labelStyle: TextStyle(color: Colors.indigo.shade700),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.indigo),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               maxLines: 3,
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Priority',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.indigo,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: ['high', 'medium', 'low'].map((priority) {
//                 return ChoiceChip(
//                   label: Text(priority.toUpperCase()),
//                   selected: selectedPriority == priority,
//                   selectedColor: Colors.indigo.shade300,
//                   backgroundColor: Colors.grey.shade300,
//                   labelStyle: TextStyle(
//                     color: selectedPriority == priority
//                         ? Colors.white
//                         : Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   onSelected: (selected) {
//                     ref.read(priorityProvider.notifier).state = priority;
//                   },
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.indigo.shade300,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                 ),
//                 onPressed: () {
//                   final title = ref.read(taskTitleProvider).trim();
//                   final description = ref.read(taskDescriptionProvider).trim();

//                   if (title.isNotEmpty && description.isNotEmpty) {
//                     ref.read(taskProvider.notifier).addTask(
//                           title,
//                           description,
//                           DateTime.now(),
//                           selectedPriority,
//                         );
//                     // Clear text fields after adding the task
//                     ref.read(taskTitleProvider.notifier).state = '';
//                     ref.read(taskDescriptionProvider.notifier).state = '';
//                     Navigator.pop(context);
//                   } else {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return const Dialog(
//                             child: Text("Fill the fields"),
//                           );
//                         });
//                   }
//                 },
//                 child: const Text(
//                   'Add Task',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }