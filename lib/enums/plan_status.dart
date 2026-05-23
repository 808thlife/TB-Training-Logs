import 'package:hive_ce/hive.dart';

part 'plan_status.g.dart';

@HiveType(typeId: 10)
enum PlanStatus {
  @HiveField(0)
  active,
  @HiveField(1)
  completed,
  @HiveField(2)
  archived,
}

extension PlanStatusLabel on PlanStatus {
  String get label {
    switch (this) {
      case PlanStatus.active:
        return "Active";
      case PlanStatus.archived:
        return "Archived";
      case PlanStatus.completed:
        return "Completed";
    }
  }
}
