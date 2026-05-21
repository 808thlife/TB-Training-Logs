import 'package:flutter/material.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/widgets/no_plan_view.dart';
import 'package:tb_training_logs/widgets/plans_list_home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.plans});

  final List<TrainingPlan> plans;

  @override
  Widget build(BuildContext context) {
    if (plans.isEmpty) {
      return const NoPlanView();
    }

    return PlansListHomePage(plans: plans);
  }
}
