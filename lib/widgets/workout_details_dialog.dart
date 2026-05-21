import 'package:flutter/material.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/workout_day_model.dart';

class WorkoutDetailsDialog extends StatelessWidget {
  const WorkoutDetailsDialog({super.key, required this.workoutDay});
  final WorkoutDay workoutDay;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Message which will be pop up on the screen
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              workoutDay.type.label,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ...workoutDay.exercises.map((exercise) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    exercise.exercise.name,

                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${exercise.intensity}% • '
                    '${exercise.setsAndReps}',
                  ),

                  Text(
                    'Target Weight: '
                    '${exercise.targetWeight.toStringAsFixed(1)} kg',
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 10),
          Text(
            workoutDay.type.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
