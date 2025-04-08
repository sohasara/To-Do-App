import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/application/pages/bottom/bottom_state.dart';
import 'package:to_do/application/pages/completed_task/comp_task.dart';
import 'package:to_do/application/pages/home/home_screen/home.dart';

import '../priority/priority_home.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(indexProvider);
    final List<Widget> pages = <Widget>[
      const HomePage(),
      const CompTask(),
      const PriorityHome(),
    ];
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo.shade300,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: (value) => ref.read(indexProvider.notifier).state = value,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            label: 'completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'priority',
          ),
        ],
      ),
    );
  }
}
