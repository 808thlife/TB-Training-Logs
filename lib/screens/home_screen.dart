import 'package:flutter/material.dart';
import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/widgets/plans_list_home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.plans});

  final List<TrainingPlan> plans;
  List<TrainingPlan> byStatus(List<TrainingPlan> plans, PlanStatus status) {
    return plans.where((p) => p.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    final active = byStatus(plans, PlanStatus.active);

    final completed = byStatus(plans, PlanStatus.completed);

    final archived = byStatus(plans, PlanStatus.archived);

    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Plans"),
          actions: [
            IconButton(
              onPressed: () {
                // Handle add new plan action
              },
              icon: const Icon(Icons.add),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Active"),

              Tab(text: "Completed"),

              Tab(text: "Archived"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            PlansList(plans: active),

            PlansList(plans: completed),

            PlansList(plans: archived),
          ],
        ),
      ),
    );
  }
}
