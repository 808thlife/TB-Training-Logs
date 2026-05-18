import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:uuid/uuid.dart';

class TrainingPlan {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  // The higher the value, the more priority is given to max-strength sessions and vice versa.
  // range: 0 to 10
  final int priority;

  PlanStatus status;

  final List<WorkoutDay> schedule;

  TrainingPlan({
    String? id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.priority,
    required this.status,
    required this.schedule,
  }) : id = id ?? const Uuid().v4();
}

class WorkoutDay {
  final DateTime date;
  final WorkoutType type;

  WorkoutDay({required this.date, required this.type});
}
