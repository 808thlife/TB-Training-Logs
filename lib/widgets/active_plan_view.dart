import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/widgets/workout_day_card.dart';

class ActivePlanView extends StatelessWidget {
  const ActivePlanView({super.key, required this.plan});

  final TrainingPlan plan;

  @override
  Widget build(BuildContext context) {
    final schedule = plan.schedule;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(plan.name, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10),
            Text(
              "${DateFormat('MMMM d, y').format(plan.startDate)}"
              " - "
              "${DateFormat('MMMM d, y').format(plan.endDate)}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            for (var day in schedule) WorkoutDayCard(workoutDay: day),
          ],
        ),
      ),
    );
  }
}
