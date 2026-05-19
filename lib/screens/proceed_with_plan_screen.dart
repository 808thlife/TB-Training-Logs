import 'package:flutter/material.dart';
import 'package:tb_training_logs/enums/exercises.dart';
import 'package:tb_training_logs/models/create_plan_form_model.dart';
import 'package:tb_training_logs/screens/home_screen.dart';

import 'package:tb_training_logs/utils/generate_training_plan.dart';

//User is prompted to enter their 1RMs into the app.
class ProceedWithPlan extends StatefulWidget {
  const ProceedWithPlan({super.key, required this.formModel});

  final CreatePlanFormModel formModel;

  @override
  State<ProceedWithPlan> createState() => _ProceedWithPlanState();
}

class _ProceedWithPlanState extends State<ProceedWithPlan> {
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
            TextField(
              controller: pushController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: formData.selectedPush!.label,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: legsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: formData.selectedLegs!.label,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: deadliftController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Deadlift 1RM"),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: pullController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: formData.selectedPull!.label,
              ),
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

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(plans: [plan]),
                  ),
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
