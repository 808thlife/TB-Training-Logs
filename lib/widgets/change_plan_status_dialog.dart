import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/providers/plans_provider.dart';

class ChangePlanStatusDialog extends ConsumerWidget {
  const ChangePlanStatusDialog({super.key, required this.plan});

  final TrainingPlan plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          onPressed: () {
            ref.read(planProvider.notifier).completePlan(plan.id);
            Navigator.pop(context);
          },
          child: const Text('Mark as completed'),
        ),
        TextButton(
          onPressed: () {
            ref.read(planProvider.notifier).archivePlan(plan.id);
            Navigator.pop(context);
          },
          child: const Text('Archive'),
        ),
        TextButton(
          onPressed: () {
            ref.read(planProvider.notifier).deletePlan(plan.id);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
