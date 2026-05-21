import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/providers/plans_provider.dart';
import 'package:tb_training_logs/screens/create_plan_screen.dart';
import 'package:tb_training_logs/widgets/plans_list_home_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  List<TrainingPlan> byStatus(List<TrainingPlan> plans, PlanStatus status) {
    return plans.where((p) => p.status == status).toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plans = ref.watch(planProvider);
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
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePlanScreen()),
                  );
                };
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
