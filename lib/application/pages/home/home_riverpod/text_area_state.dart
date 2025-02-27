import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Provider for managing priority selection
final priorityProvider = StateProvider<String>((ref) => 'medium');
