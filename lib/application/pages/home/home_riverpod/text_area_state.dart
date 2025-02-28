import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Provider for managing priority selection
final priorityProvider = StateProvider<String>((ref) => 'medium');
final taskTitleProvider = StateProvider<String>((ref) => '');
final taskDescriptionProvider = StateProvider<String>((ref) => '');
final taskDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
