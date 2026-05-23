import 'package:hive_ce/hive.dart';

part 'exercises.g.dart';

@HiveType(typeId: 20)
enum PushExercises {
  @HiveField(0)
  bp,

  @HiveField(1)
  ohp,

  @HiveField(2)
  dips,
}

@HiveType(typeId: 21)
enum PullExercises {
  @HiveField(0)
  pu,

  @HiveField(1)
  br,

  @HiveField(2)
  lp,
}

@HiveType(typeId: 22)
enum LegsExercises {
  @HiveField(0)
  bsq,

  @HiveField(1)
  frsq,

  @HiveField(2)
  beltsq,
}

@HiveType(typeId: 23)
enum Deadlift {
  @HiveField(0)
  df,
}

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
