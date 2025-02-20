import 'package:flutter/material.dart';

class CompTask extends StatelessWidget {
  const CompTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
