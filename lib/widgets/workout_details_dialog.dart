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
      title: Text('Info about the workout'),
      // Message which will be pop up on the screen
      content: Text(workoutDay.type.label),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('ACCEPT'),
        ),
      ],
    );
  }
}
