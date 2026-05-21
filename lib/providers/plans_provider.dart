import 'package:flutter_riverpod/legacy.dart';
import 'package:tb_training_logs/models/training_plan.dart';

class PlanNotifier extends StateNotifier<List<TrainingPlan>> {
  PlanNotifier() : super([]);

  void addPlan(TrainingPlan plan) {
    state = [...state, plan];
  }

  void updatePlan(TrainingPlan updatedPlan) {
    state = [
      for (final plan in state)
        if (plan.id == updatedPlan.id) updatedPlan else plan,
    ];
  }

  void deletePlan(String id) {
    state = state.where((plan) => plan.id != id).toList();
  }
}

final planProvider = StateNotifierProvider<PlanNotifier, List<TrainingPlan>>(
  (ref) => PlanNotifier(),
);
