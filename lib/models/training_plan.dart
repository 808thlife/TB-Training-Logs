import 'package:uuid/uuid.dart';

class TrainingPlan {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  // The higher the value, the more priority is given to max-strength sessions and vice versa.
  // range: 0 to 10
  final int priority;

  bool active;

  TrainingPlan({
    String? id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.priority,
    required this.active,
  }) : id = id ?? const Uuid().v4();
}
