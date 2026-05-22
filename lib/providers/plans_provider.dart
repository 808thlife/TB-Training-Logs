import 'package:flutter_riverpod/legacy.dart';
import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/models/training_plan.dart';

class PlanNotifier extends StateNotifier<List<TrainingPlan>> {
  PlanNotifier() : super([]);

  void addPlan(TrainingPlan plan) {
    final existingActivePlan = state
        .where((plan) => plan.status == PlanStatus.active)
        .first;

    // Archive already existing plan when a user already has an active one.
    final updatedPlan = TrainingPlan(
      id: existingActivePlan.id,
      name: existingActivePlan.name,
      startDate: existingActivePlan.startDate,
      endDate: existingActivePlan.endDate,
      priority: existingActivePlan.priority,
      status: PlanStatus.archived,
      schedule: existingActivePlan.schedule,
    );

    updatePlan(updatedPlan);
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

  void archivePlan(String id) {
    final plan = state.firstWhere((plan) => plan.id == id);
    final updatedPlan = TrainingPlan(
      id: plan.id,
      name: plan.name,
      startDate: plan.startDate,
      endDate: plan.endDate,
      priority: plan.priority,
      status: PlanStatus.archived,
      schedule: plan.schedule,
    );
    updatePlan(updatedPlan);
  }

  void completePlan(String id) {
    final plan = state.firstWhere((plan) => plan.id == id);
    final updatedPlan = TrainingPlan(
      id: plan.id,
      name: plan.name,
      startDate: plan.startDate,
      endDate: plan.endDate,
      priority: plan.priority,
      status: PlanStatus.completed,
      schedule: plan.schedule,
    );
    updatePlan(updatedPlan);
  }

  void makeActive(String id) {
    final plan = state.firstWhere((plan) => plan.id == id);
    final updatedPlan = TrainingPlan(
      id: plan.id,
      name: plan.name,
      startDate: plan.startDate,
      endDate: plan.endDate,
      priority: plan.priority,
      status: PlanStatus.active,
      schedule: plan.schedule,
    );
    updatePlan(updatedPlan);
  }
}

final planProvider = StateNotifierProvider<PlanNotifier, List<TrainingPlan>>(
  (ref) => PlanNotifier(),
);
