import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Screen"),
      ),
      body: const Column(
        children: [
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
