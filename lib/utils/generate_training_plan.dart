import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/create_plan_form_model.dart';
import 'package:tb_training_logs/models/training_plan.dart';

void createPlan(CreatePlanFormModel form) {
  final int priority = form.priority.toInt();

  if (priority >= 4) {
    _genericPlan(form);
  } else if (priority >= 7) {
    _strengthFirstPlan();
  } else {
    _conditioningHeavyPlan();
  }
}

//default 6 week cycle (op 3 weeks, 3 weeks fighter)
List<WorkoutDay> _genericPlan(CreatePlanFormModel form) {
  final schedule = <WorkoutDay>[];

  for (int cycle = 0; cycle < form.cycles; cycle++) {
    final cycleStart = form.startDate.add(Duration(days: cycle * 42));

    // -------------------------
    // WEEK BLOCKS
    // -------------------------

    // OPERATOR (weeks 1–3)
    for (int week = 0; week < 3; week++) {
      final weekStart = cycleStart.add(Duration(days: week * 7));
      schedule.addAll(_operatorWeek(weekStart));
    }

    // FIGHTER (weeks 4–6)
    for (int week = 3; week < 6; week++) {
      final weekStart = cycleStart.add(Duration(days: week * 7));
      schedule.addAll(_fighterWeek(weekStart));
    }
  }

  return schedule;
}

void _conditioningHeavyPlan() {}

void _strengthFirstPlan() {}

List<WorkoutDay> _operatorWeek(DateTime start) {
  return [
    WorkoutDay(date: start, type: WorkoutType.strength),
    WorkoutDay(
      date: start.add(Duration(days: 1)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(date: start.add(Duration(days: 2)), type: WorkoutType.strength),
    WorkoutDay(
      date: start.add(Duration(days: 3)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(date: start.add(Duration(days: 4)), type: WorkoutType.strength),
    WorkoutDay(
      date: start.add(Duration(days: 5)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(date: start.add(Duration(days: 6)), type: WorkoutType.rest),
  ];
}

List<WorkoutDay> _fighterWeek(DateTime start) {
  return [
    WorkoutDay(date: start, type: WorkoutType.strength),
    WorkoutDay(
      date: start.add(Duration(days: 1)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(
      date: start.add(Duration(days: 2)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(date: start.add(Duration(days: 3)), type: WorkoutType.strength),
    WorkoutDay(
      date: start.add(Duration(days: 4)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(
      date: start.add(Duration(days: 5)),
      type: WorkoutType.conditioning,
    ),
    WorkoutDay(date: start.add(Duration(days: 6)), type: WorkoutType.rest),
  ];
}
