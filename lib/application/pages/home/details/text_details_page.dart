import 'package:flutter/material.dart';

class TextDetailsPage extends StatelessWidget {
  final String tittle;
  final String description;
  final String date;

  const TextDetailsPage(
      {super.key,
      required this.tittle,
      required this.description,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade300,
        title: Text(
          tittle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
