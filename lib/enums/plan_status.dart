enum PlanStatus { active, completed, archived }

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
