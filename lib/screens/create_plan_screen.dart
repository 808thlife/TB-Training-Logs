import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_training_logs/enums/exercises.dart';
import 'package:tb_training_logs/models/create_plan_form_model.dart';
import 'package:tb_training_logs/screens/proceed_with_plan_screen.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final TextEditingController nameController = TextEditingController();

  double priority = 5;
  int cycles = 1;
  DateTime startDate = DateTime.now();

  DateTime get endDate => startDate.add(Duration(days: cycles * 42));

  PushExercises? selectedPush;
  PullExercises? selectedPull;
  LegsExercises? selectedLegs;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Creating a new plan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Plan name"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Plan name is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              Text("Priority: ${priority.toInt()}"),
              Slider(
                value: priority,
                min: 0,
                max: 10,
                divisions: 10,
                label: priority.round().toString(),
                onChanged: (value) {
                  setState(() {
                    priority = value;
                  });
                },
              ),

              Text(
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                priority >= 7
                    ? "Strength-focused plan"
                    : priority >= 4
                    ? "Balanced plan"
                    : "Conditioning-focused plan",
              ),
              const SizedBox(height: 20),
              const Text("Exercises (PUSH/PULL/LEGS)"),
              Center(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    DropdownButtonFormField<PushExercises>(
                      initialValue: selectedPush,
                      items: PushExercises.values.map((exercise) {
                        return DropdownMenuItem(
                          value: exercise,
                          child: Text(exercise.label),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPush = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "This field is mandatory";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(width: 16),
                    DropdownButtonFormField<PullExercises>(
                      initialValue: selectedPull,
                      items: PullExercises.values.map((exercise) {
                        return DropdownMenuItem(
                          value: exercise,
                          child: Text(exercise.label),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedPull = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "This field is mandatory";
                        }
                        return null;
                      },
                    ),
                    SizedBox(width: 16),
                    DropdownButtonFormField<LegsExercises>(
                      initialValue: selectedLegs,
                      items: LegsExercises.values.map((exercise) {
                        return DropdownMenuItem(
                          value: exercise,
                          child: Text(exercise.label),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLegs = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "This field is mandatory";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Text("Cycles: $cycles"),
              DropdownButton<int>(
                value: cycles,
                items: [1, 2, 3, 4]
                    .map(
                      (c) =>
                          DropdownMenuItem(value: c, child: Text("$c cycles")),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    cycles = value!;
                  });
                },
              ),

              const SizedBox(height: 20),
              TextButton.icon(
                icon: Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onPressed: () async {
                  final today = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: startDate,
                    firstDate: today,
                    lastDate: DateTime(today.year, today.month + 1, today.day),
                  );

                  if (picked != null) {
                    setState(() {
                      startDate = picked;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                label: Text(
                  "Select Start Date",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "Estimated end date: ${DateFormat('MMMM d, y').format(endDate)}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  final formData = CreatePlanFormModel(
                    name: nameController.text,
                    priority: priority,
                    cycles: cycles,
                    startDate: startDate,
                    deadlift: Deadlift.df,
                    selectedLegs: selectedLegs,
                    selectedPull: selectedPull,
                    selectedPush: selectedPush,
                  );

                  // Sending the form data to the other screen.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProceedWithPlan(formModel: formData),
                    ),
                  );
                },
                child: const Text("Proceed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
