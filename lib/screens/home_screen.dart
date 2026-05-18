import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/widgets/active_plan_view.dart';
import 'package:tb_training_logs/widgets/no_plan_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.plans});

  final List<TrainingPlan> plans;

  @override
  Widget build(BuildContext context) {
    final activePlan = plans.firstWhereOrNull((p) => p.active);
    if (activePlan == null) {
      return const NoPlanView();
    }
    return ActivePlanView(plan: activePlan);
  }
}
