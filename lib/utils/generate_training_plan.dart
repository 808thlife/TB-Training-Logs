import 'package:tb_training_logs/enums/exercises.dart';
import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/create_plan_form_model.dart';
import 'package:tb_training_logs/models/exercise_model.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/models/workout_day_model.dart';

TrainingPlan createPlan(CreatePlanFormModel form) {
  final int priority = form.priority.toInt();

  List<WorkoutDay> schedule;

  if (priority >= 7) {
    schedule = _strengthFirstPlan(form);
  } else if (priority >= 4) {
    schedule = _genericPlan(form);
  } else {
    schedule = _conditioningHeavyPlan(form);
  }

  return TrainingPlan(
    name: form.name,
    startDate: form.startDate,
    endDate: form.endDate,
    priority: priority,
    status: PlanStatus.active,
    schedule: schedule,
  );
}

//default 6 week cycle (op 3 weeks, 3 weeks fighter)
List<WorkoutDay> _genericPlan(CreatePlanFormModel form) {
  final schedule = <WorkoutDay>[];
  const operatorProgression = [70, 80, 90];
  const fighterProgression = [75, 80, 90];

  for (int cycle = 0; cycle < form.cycles; cycle++) {
    final cycleStart = form.startDate.add(Duration(days: cycle * 42));

    // -------------------------
    // WEEK BLOCKS
    // -------------------------

    // OPERATOR (weeks 1–3)
    for (int week = 0; week < 3; week++) {
      final weekStart = cycleStart.add(Duration(days: week * 7));

      final intensity = operatorProgression[week];

      schedule.addAll(_operatorWeek(weekStart, intensity, form));
    }

    // FIGHTER (weeks 4–6)
    for (int week = 3; week < 6; week++) {
      final weekStart = cycleStart.add(Duration(days: week * 7));

      final progressionIndex = week - 3;

      final intensity = fighterProgression[progressionIndex];

      schedule.addAll(_fighterWeek(weekStart, intensity, form));
    }
  }

  return schedule;
}

List<WorkoutDay> _conditioningHeavyPlan(CreatePlanFormModel form) {
  final schedule = <WorkoutDay>[];
  const fighterProgression = [75, 80, 90, 75, 85, 95];

  for (int cycle = 0; cycle < form.cycles; cycle++) {
    final cycleStart = form.startDate.add(Duration(days: cycle * 42));

    // -------------------------
    // WEEK BLOCKS
    // -------------------------
    // FIGHTER (weeks 4–6)
    for (int week = 0; week < 6; week++) {
      final weekStart = cycleStart.add(Duration(days: week * 7));

      final progressionIndex = week;

      final intensity = fighterProgression[progressionIndex];

      schedule.addAll(_fighterWeek(weekStart, intensity, form));
    }
  }

  return schedule;
}

List<WorkoutDay> _strengthFirstPlan(CreatePlanFormModel form) {
  final schedule = <WorkoutDay>[];
  const fighterProgression = [70, 80, 90, 75, 85, 95];

  for (int cycle = 0; cycle < form.cycles; cycle++) {
    final cycleStart = form.startDate.add(Duration(days: cycle * 42));
    for (int week = 0; week < 6; week++) {
      final weekStart = cycleStart.add(Duration(days: week * 7));

      final progressionIndex = week;

      final intensity = fighterProgression[progressionIndex];

      schedule.addAll(_operatorWeek(weekStart, intensity, form));
    }
  }

  return schedule;
}

List<WorkoutDay> _operatorWeek(
  DateTime start,
  int intensity,
  CreatePlanFormModel form,
) {
  return [
    WorkoutDay(
      date: start,
      type: WorkoutType.strength,
      exercises: _buildStrengthExercises(form, intensity),
    ),
    WorkoutDay(date: start.add(Duration(days: 1)), type: WorkoutType.easyRun),
    WorkoutDay(
      date: start.add(Duration(days: 2)),
      type: WorkoutType.strength,
      exercises: _buildStrengthExercises(form, intensity),
    ),
    WorkoutDay(
      date: start.add(Duration(days: 3)),
      type: WorkoutType.speedSession,
    ),
    WorkoutDay(
      date: start.add(Duration(days: 4)),
      type: WorkoutType.strength,
      exercises: _buildStrengthExercises(form, intensity),
    ),
    WorkoutDay(date: start.add(Duration(days: 5)), type: WorkoutType.longRun),
    WorkoutDay(date: start.add(Duration(days: 6)), type: WorkoutType.rest),
  ];
}

List<WorkoutDay> _fighterWeek(
  DateTime start,
  int intensity,
  CreatePlanFormModel form,
) {
  return [
    WorkoutDay(
      date: start,
      type: WorkoutType.strength,
      exercises: _buildStrengthExercises(form, intensity),
    ),
    WorkoutDay(date: start.add(Duration(days: 1)), type: WorkoutType.easyRun),
    WorkoutDay(
      date: start.add(Duration(days: 2)),
      type: WorkoutType.speedSession,
    ),
    WorkoutDay(
      date: start.add(Duration(days: 3)),
      type: WorkoutType.strength,
      exercises: _buildStrengthExercises(form, intensity),
    ),
    WorkoutDay(date: start.add(Duration(days: 4)), type: WorkoutType.easyRun),
    WorkoutDay(date: start.add(Duration(days: 5)), type: WorkoutType.longRun),
    WorkoutDay(date: start.add(Duration(days: 6)), type: WorkoutType.rest),
  ];
}

List<WorkoutExercise> _buildStrengthExercises(
  CreatePlanFormModel form,
  int intensity,
) {
  return [
    WorkoutExercise(
      exercise: Exercise(name: form.selectedPush!.label, oneRM: form.push1RM!),
      intensity: intensity,
    ),

    WorkoutExercise(
      exercise: Exercise(name: form.selectedPull!.label, oneRM: form.pull1RM!),
      intensity: intensity,
    ),

    WorkoutExercise(
      exercise: Exercise(name: form.selectedLegs!.label, oneRM: form.legs1RM!),
      intensity: intensity,
    ),
  ];
}
