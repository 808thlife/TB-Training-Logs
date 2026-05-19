import 'package:flutter/material.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/enums/workout_type.dart';

class ActivePlanView extends StatelessWidget {
  const ActivePlanView({super.key, required this.plan});

  final TrainingPlan plan;

  String _getWorkoutLabel(WorkoutType type) {
    switch (type) {
      case WorkoutType.strength:
        return 'Strength';
      case WorkoutType.speed_session:
        return 'Speed Session';
      case WorkoutType.rest:
        return 'Rest';
      case WorkoutType.easy_run:
        return "Easy Run";
      case WorkoutType.long_run:
        return "Long Run";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Group workouts by week
    final weeks = <int, List<WorkoutDay>>{};
    for (final workout in plan.schedule) {
      final weekNumber = _getWeekNumber(plan.startDate, workout.date);
      weeks.putIfAbsent(weekNumber, () => []).add(workout);
    }

    final sortedWeeks = weeks.keys.toList()..sort();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              plan.name,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '${_formatDate(plan.startDate)} - ${_formatDate(plan.endDate)}',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
            ),
            SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildScheduleTable(context, sortedWeeks, weeks),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  int _getWeekNumber(DateTime planStart, DateTime workoutDate) {
    final difference = workoutDate.difference(planStart).inDays;
    return (difference ~/ 7) + 1;
  }

  Widget _buildScheduleTable(
    BuildContext context,
    List<int> sortedWeeks,
    Map<int, List<WorkoutDay>> weeks,
  ) {
    const dayHeaders = [
      'Week',
      'Day 1',
      'Day 2',
      'Day 3',
      'Day 4',
      'Day 5',
      'Day 6',
      'Day 7',
    ];

    final tableData = <List<String>>[];

    // Add header row
    tableData.add(dayHeaders);

    // Add data rows for each week
    for (final weekNum in sortedWeeks) {
      final weekWorkouts = weeks[weekNum]!;
      weekWorkouts.sort((a, b) => a.date.compareTo(b.date));

      final row = <String>['Week $weekNum'];

      // Get the first date of this week
      final firstDate = weekWorkouts.first.date;
      final startOfWeek = firstDate.subtract(
        Duration(days: firstDate.weekday - 1),
      );

      // Create a map of dates to workouts
      final workoutMap = {
        for (var w in weekWorkouts)
          DateTime(w.date.year, w.date.month, w.date.day): w,
      };

      // Add each day of the week
      for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
        final date = startOfWeek.add(Duration(days: dayIndex));
        final workout = workoutMap[DateTime(date.year, date.month, date.day)];
        row.add(workout != null ? _getWorkoutLabel(workout.type) : '');
      }

      tableData.add(row);
    }

    return Table(
      border: TableBorder.all(color: Colors.black, width: 1),
      columnWidths: {
        0: FixedColumnWidth(80),
        for (int i = 1; i < 8; i++) i: FixedColumnWidth(110),
      },
      children: tableData.asMap().entries.map((entry) {
        final isHeader = entry.key == 0;
        final cells = entry.value;

        return TableRow(
          decoration: BoxDecoration(
            color: isHeader ? Colors.grey.shade200 : Colors.white,
          ),
          children: cells.map((cellText) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text(
                cellText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  fontSize: isHeader ? 14 : 13,
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
