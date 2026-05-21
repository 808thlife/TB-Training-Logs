import 'package:flutter/material.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/training_plan.dart';

class WorkoutDetailsDialog extends StatelessWidget {
  const WorkoutDetailsDialog({super.key, required this.workoutDay});
  final WorkoutDay workoutDay;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // To display the title it is optional
      title: Text(
        'Info about the workout',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      // Message which will be pop up on the screen
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            workoutDay.type.label,
            style: Theme.of(context).textTheme.headlineSmall,
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
