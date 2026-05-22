import 'package:flutter/material.dart';
import 'package:tb_training_logs/enums/workout_time_status.dart';
import 'package:tb_training_logs/models/training_plan.dart';
import 'package:tb_training_logs/models/workout_day_model.dart';

import 'package:tb_training_logs/widgets/change_plan_status_dialog.dart';
import 'package:tb_training_logs/widgets/one_rm_dialog.dart';
import 'package:tb_training_logs/widgets/workout_day_card.dart';

class ActivePlanView extends StatelessWidget {
  const ActivePlanView({super.key, required this.plan});

  final TrainingPlan plan;
  Widget _buildFiltered(List<WorkoutDay> schedule, WorkoutTimeStatus type) {
    final filtered = schedule.where((w) {
      return getWorkoutStatus(w.date) == type;
    }).toList();

    return ListView.builder(
      itemCount: filtered.length,

      itemBuilder: (context, index) {
        return WorkoutDayCard(workoutDay: filtered[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final schedule = plan.schedule;

    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name.toUpperCase()),
        actions: [
          IconButton(
            icon: Icon(Icons.query_stats),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => OneRmDialog(plan: plan),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ChangePlanStatusDialog(plan: plan),
              );
            },
          ),
        ],
      ),

      body: DefaultTabController(
        length: 3,

        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: "Today"),

                Tab(text: "Upcoming"),

                Tab(text: "History"),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  _buildFiltered(schedule, WorkoutTimeStatus.today),

                  _buildFiltered(schedule, WorkoutTimeStatus.future),

                  _buildFiltered(schedule, WorkoutTimeStatus.past),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
