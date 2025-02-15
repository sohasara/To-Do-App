import 'package:flutter/material.dart';
import 'package:to_do/application/pages/home/text_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('To Do App'),
      ),
    );
  }
}
