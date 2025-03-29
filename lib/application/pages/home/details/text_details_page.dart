import 'package:flutter/material.dart';

class TextDetailsPage extends StatelessWidget {
  final String tittle;
  final String description;
  final String dateF;
  final String priority;

  const TextDetailsPage({
    super.key,
    required this.tittle,
    required this.description,
    required this.dateF,
    required this.priority,
  });

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
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Text(
                    'Finishing Date: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dateF,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Text(
                    'priority: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    priority,
                    style: TextStyle(
                      fontSize: 20,
                      color: priority.toLowerCase() == "high"
                          ? Colors.red
                          : priority.toLowerCase() == "medium"
                              ? Colors.yellow
                              : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
