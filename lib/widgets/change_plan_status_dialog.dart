import 'package:flutter/material.dart';
import 'package:tb_training_logs/models/training_plan.dart';

class ChangePlanStatusDialog extends StatelessWidget {
  const ChangePlanStatusDialog({super.key, required this.plan});

  final TrainingPlan plan;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change Plan Status'),
      content: const Text(
        'Are you sure you want to change the status of this plan?',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Mark as completed'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Archive'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
