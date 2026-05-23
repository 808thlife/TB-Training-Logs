import 'package:hive_ce/hive.dart';
import 'package:tb_training_logs/enums/plan_status.dart';

import 'package:tb_training_logs/models/workout_day_model.dart';
import 'package:uuid/uuid.dart';

part 'training_plan.g.dart';

@HiveType(typeId: 0)
class TrainingPlan {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime startDate;
  @HiveField(3)
  final DateTime endDate;

  // The higher the value, the more priority is given to max-strength sessions and vice versa.
  // range: 0 to 10
  @HiveField(4)
  final int priority;

  @HiveField(5)
  PlanStatus status;

  @HiveField(6)
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
