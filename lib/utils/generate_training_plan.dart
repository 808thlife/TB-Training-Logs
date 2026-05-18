import 'package:tb_training_logs/models/create_plan_form_model.dart';

void createPlan(CreatePlanFormModel form) {
  final int priority = form.priority.toInt();

  if (priority >= 4) {
    _genericPlan();
  } else if (priority >= 7) {
    _strengthFirstPlan();
  } else {
    _conditioningHeavyPlan();
  }
}

void _genericPlan() {}

void _conditioningHeavyPlan() {}

void _strengthFirstPlan() {}
