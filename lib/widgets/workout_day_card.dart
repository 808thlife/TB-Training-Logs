import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/training_plan.dart';

class WorkoutDayCard extends StatelessWidget {
  const WorkoutDayCard({super.key, required this.workoutDay});

  final WorkoutDay workoutDay;

  Icon _workoutIcon(WorkoutType type) {
    switch (type) {
      case WorkoutType.strength:
        return const Icon(Icons.fitness_center);

      case WorkoutType.longRun || WorkoutType.easyRun:
        return const Icon(Icons.directions_run);

      case WorkoutType.speedSession:
        return const Icon(Icons.speed);

      case WorkoutType.rest:
        return const Icon(Icons.hotel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Text(DateFormat('M/d/y').format(workoutDay.date)),
                const SizedBox(height: 5),
                _workoutIcon(workoutDay.type),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
