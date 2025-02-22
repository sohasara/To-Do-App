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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Task $index'),
                    subtitle: Text('Description of Task $index'),
                    trailing: const Text('Date: 12/12/2021'),
                  ),
                ),
              );
            }));
  }
}
