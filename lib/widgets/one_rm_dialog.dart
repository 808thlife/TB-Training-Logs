import 'package:flutter/material.dart';
import 'package:tb_training_logs/models/training_plan.dart';

class OneRmDialog extends StatelessWidget {
  const OneRmDialog({super.key, required this.plan});

  final TrainingPlan plan;

  Map<String, double> extractUnique1RMs(TrainingPlan plan) {
    final Map<String, double> exercise1RMs = {};

    for (var workoutDay in plan.schedule) {
      for (var workoutExercise in workoutDay.exercises) {
        final exercise = workoutExercise.exercise;

        // Option A: Keep the highest 1RM found
        if (!exercise1RMs.containsKey(exercise.name) ||
            exercise.oneRM > exercise1RMs[exercise.name]!) {
          exercise1RMs[exercise.name] = exercise.oneRM;
        }
      }
    }
    return exercise1RMs;
  }

  @override
  Widget build(BuildContext context) {
    final unique1RMs = extractUnique1RMs(plan);
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.fitness_center,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(width: 10),
          Text('Current 1RM Records'),
        ],
      ),
      content: unique1RMs.isEmpty
          ? const SizedBox(
              height: 100,
              child: Center(child: Text('No exercises found in this plan.')),
            )
          : SizedBox(
              width:
                  double.maxFinite, // Prevents layout sizing errors in dialogs
              child: ListView.separated(
                shrinkWrap:
                    true, // Tells ListView to only take up required space
                itemCount: unique1RMs.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  String exerciseName = unique1RMs.keys.elementAt(index);
                  double oneRMValue = unique1RMs.values.elementAt(index);

                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      exerciseName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${oneRMValue.toStringAsFixed(1)} kg', // or lbs
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
