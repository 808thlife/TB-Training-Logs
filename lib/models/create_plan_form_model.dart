import 'package:tb_training_logs/enums/exercises.dart';

class CreatePlanFormModel {
  String name;
  double priority;
  int cycles;
  DateTime startDate;

  PushExercises? selectedPush;
  PullExercises? selectedPull;
  LegsExercises? selectedLegs;
  Deadlift? deadlift;

  double? push1RM;
  double? pull1RM;
  double? legs1RM;
  double? deadlift1RM;

  CreatePlanFormModel({
    required this.name,
    required this.priority,
    required this.cycles,
    required this.startDate,
    this.deadlift,
    this.selectedPush,
    this.selectedPull,
    this.selectedLegs,
    this.pull1RM,
    this.deadlift1RM,
    this.legs1RM,
    this.push1RM,
  });

  DateTime get endDate => startDate.add(Duration(days: cycles * 42));
}
