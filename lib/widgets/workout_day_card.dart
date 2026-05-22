import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/workout_day_model.dart';
import 'package:tb_training_logs/widgets/workout_details_dialog.dart';
import 'package:tb_training_logs/widgets/workout_notes_window.dart';

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
    final today = DateTime.now();
    final isToday =
        workoutDay.date.year == today.year &&
        workoutDay.date.month == today.month &&
        workoutDay.date.day == today.day;
    return SizedBox(
      height: 100,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust radius as needed
        ),
        color: isToday
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.5)
            : null,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) =>
                    WorkoutDetailsDialog(workoutDay: workoutDay),
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat('M/d').format(workoutDay.date)),
                        const SizedBox(height: 5),
                        _workoutIcon(workoutDay.type),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  workoutDay.type.label,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          WorkoutNotesDetails(workoutDay: workoutDay),
                    );
                  },
                  icon: Icon(Icons.edit_note),
                ),
                // Adding 2 calendar. Will implement later
                IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
