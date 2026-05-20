enum WorkoutType { strength, easyRun, speedSession, longRun, rest }

extension WorkoutTypeLabel on WorkoutType {
  String get label {
    switch (this) {
      case WorkoutType.easyRun:
        return "Easy Run";
      case WorkoutType.strength:
        return "Strength";
      case WorkoutType.longRun:
        return "Long Run";
      case WorkoutType.rest:
        return "Rest";
      case WorkoutType.speedSession:
        return "Speed session";
    }
  }
}
