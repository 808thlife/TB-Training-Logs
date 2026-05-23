import 'package:hive_ce/hive.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/exercise_model.dart';

part 'workout_day_model.g.dart';

@HiveType(typeId: 1)
class WorkoutDay {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final WorkoutType type;

  @HiveField(2)
  final List<WorkoutExercise> exercises;

  @HiveField(3)
  String? notes;

  WorkoutDay({
    required this.date,
    required this.type,
    this.exercises = const [],
    this.notes,
  });
}
