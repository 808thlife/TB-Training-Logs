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

extension WorkoutTypeInfo on WorkoutType {
  String get description {
    switch (this) {
      case WorkoutType.strength:
        return "Main lifts at prescribed intensity. DO NOT GO TO FAILURE.";
      case WorkoutType.easyRun:
        return "Low intensity aerobic work. Keep the intensity low.";
      case WorkoutType.speedSession:
        return "Short intervals, high intensity. Think tempos, 400m sprints, hill sprints etc.";
      case WorkoutType.longRun:
        return "Keep the intensity low, but run for a longer duration. This is about building endurance.";
      case WorkoutType.rest:
        return "Recovery day. Focus on nutrition, hydration, and sleep. Consider light mobility work or walking if you feel up to it.";
    }
  }
}
