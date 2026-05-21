enum WorkoutTimeStatus { past, today, future }

WorkoutTimeStatus getWorkoutStatus(DateTime date) {
  final now = DateTime.now();

  final d1 = DateTime(date.year, date.month, date.day);

  final d2 = DateTime(now.year, now.month, now.day);

  if (d1.isBefore(d2)) return WorkoutTimeStatus.past;

  if (d1.isAfter(d2)) return WorkoutTimeStatus.future;

  return WorkoutTimeStatus.today;
}
