import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tb_training_logs/enums/plan_status.dart';
import 'package:tb_training_logs/providers/plans_provider.dart';
import 'package:tb_training_logs/screens/active_plan_view_screen.dart';

class PlansList extends ConsumerWidget {
  const PlansList({super.key, required this.status});

  final PlanStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plans = ref
        .watch(planProvider)
        .where((plan) => plan.status == status)
        .toList();
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];

        return GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Delete Plan"),
                content: const Text(
                  "Are you sure you want to delete this plan?",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(planProvider.notifier).deletePlan(plan.id);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Delete",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ActivePlanView(plan: plan)),
                );
              },
              child: ListTile(
                title: Text(plan.name),
                subtitle: Text(
                  "${DateFormat('MMM d').format(plan.startDate)} "
                  "- "
                  "${DateFormat('MMM d').format(plan.endDate)}",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        );
      },
    );
  }
}
