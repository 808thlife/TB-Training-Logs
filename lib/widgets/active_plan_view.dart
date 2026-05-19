import 'package:flutter/material.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/widgets/workout_day_card.dart';

class ActivePlanView extends StatelessWidget {
  const ActivePlanView({super.key, required this.plan});

  final TrainingPlan plan;

  @override
  Widget build(BuildContext context) {
    final schedule = plan.schedule;

    return Center(
      child: Column(
        children: [for (var day in schedule) WorkoutDayCard(workoutDay: day)],
      ),
    );
  }
}
