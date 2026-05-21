import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tb_training_logs/enums/exercises.dart';
import 'package:tb_training_logs/models/create_plan_form_model.dart';
import 'package:tb_training_logs/providers/plans_provider.dart';
import 'package:tb_training_logs/screens/home_screen.dart';

import 'package:tb_training_logs/utils/generate_training_plan.dart';

//User is prompted to enter their 1RMs into the app.
class ProceedWithPlan extends ConsumerStatefulWidget {
  const ProceedWithPlan({super.key, required this.formModel});

  final CreatePlanFormModel formModel;

  @override
  ConsumerState<ProceedWithPlan> createState() => _ProceedWithPlanState();
}

class _ProceedWithPlanState extends ConsumerState<ProceedWithPlan> {
  final pushController = TextEditingController();
  final legsController = TextEditingController();
  final deadliftController = TextEditingController();
  final pullController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formData = widget.formModel;
    formData.selectedLegs;
    return Scaffold(
      appBar: AppBar(title: const Text("Enter 1RM")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: pushController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: formData.selectedPush!.label,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "This field is mandatory";
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: legsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: formData.selectedLegs!.label,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "This field is mandatory";
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: deadliftController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Deadlift 1RM"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "This field is mandatory";
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: pullController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: formData.selectedPull!.label,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "This field is mandatory";
                }
                return null;
              },
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                widget.formModel.push1RM = double.tryParse(pushController.text);

                widget.formModel.legs1RM = double.tryParse(legsController.text);

                widget.formModel.deadlift1RM = double.tryParse(
                  deadliftController.text,
                );

                widget.formModel.pull1RM = double.tryParse(pullController.text);

                final plan = createPlan(formData);

                ref.read(planProvider.notifier).addPlan(plan);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
                );
              },
              child: const Text("Create a plan"),
            ),
          ],
        ),
      ),
    );
  }
}
