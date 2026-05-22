import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/screens/create_plan_screen.dart';
import 'package:tb_training_logs/widgets/plans_list_home_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  List<TrainingPlan> byStatus(List<TrainingPlan> plans, PlanStatus status) {
    return plans.where((p) => p.status == status).toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Plans"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePlanScreen()),
                );
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
            PlansList(status: PlanStatus.active),
            PlansList(status: PlanStatus.completed),
            PlansList(status: PlanStatus.archived),
          ],
        ),
      ),
    );
  }
}
