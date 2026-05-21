import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/exercise_model.dart';

class WorkoutDay {
  final DateTime date;

  final WorkoutType type;

  final List<WorkoutExercise> exercises;

  String? notes;

  WorkoutDay({
    required this.date,

    required this.type,

    this.exercises = const [],
    this.notes,
  });
}
