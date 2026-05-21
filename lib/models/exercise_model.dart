class Exercise {
  final String name;
  final double oneRM;

  Exercise({required this.name, required this.oneRM});
}

class WorkoutExercise {
  final Exercise exercise;
  final int intensity;

  const WorkoutExercise({required this.exercise, required this.intensity});

  double get targetWeight {
    return exercise.oneRM * (intensity / 100);
  }

  String get setsAndReps {
    switch (intensity) {
      case 70:
      case 75:
      case 80:
        return '3-5 x 5';

      case 85:
        return '3-4 x 3-4';

      case 90:
        return '3-4 x 2-3';

      case 95:
        return '3-4 x 1-2';

      default:
        return '3 x 5';
    }
  }
}
