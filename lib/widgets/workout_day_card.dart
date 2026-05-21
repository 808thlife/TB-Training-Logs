import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_training_logs/enums/workout_type.dart';
import 'package:tb_training_logs/models/workout_day_model.dart';
import 'package:tb_training_logs/widgets/workout_details_dialog.dart';

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
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => WorkoutDetailsDialog(workoutDay: workoutDay),
        );
      },
      child: SizedBox(
        height: 100,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
