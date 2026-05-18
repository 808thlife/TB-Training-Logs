enum PushExercises { bp, ohp, dips }

enum PullExercises { pu, br, lp }

enum LegsExercises { bsq, frsq, beltsq }

enum Deadlift { df }

extension DeadliftLabel on Deadlift {
  String get label {
    switch (this) {
      case Deadlift.df:
        return "Deadlift";
    }
  }
}

extension PushExerciseLabel on PushExercises {
  String get label {
    switch (this) {
      case PushExercises.bp:
        return "Bench Press";
      case PushExercises.ohp:
        return "Overhead Press";
      case PushExercises.dips:
        return "Dips";
    }
  }
}

extension LegsExercisesLabel on LegsExercises {
  String get label {
    switch (this) {
      case LegsExercises.frsq:
        return "Front Squat";
      case LegsExercises.bsq:
        return "Back Squat";
      case LegsExercises.beltsq:
        return "Belt Squat";
    }
  }
}

extension PullExercisesLabel on PullExercises {
  String get label {
    switch (this) {
      case PullExercises.pu:
        return "Pull ups (weighted)";
      case PullExercises.br:
        return "Barbell Row";
      case PullExercises.lp:
        return "Lat Pulldown";
    }
  }
}
