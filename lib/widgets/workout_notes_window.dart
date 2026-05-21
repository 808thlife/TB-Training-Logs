import 'package:flutter/material.dart';

import 'package:tb_training_logs/models/workout_day_model.dart';

class WorkoutNotesDetails extends StatefulWidget {
  final WorkoutDay workoutDay;

  const WorkoutNotesDetails({super.key, required this.workoutDay});

  @override
  State<WorkoutNotesDetails> createState() => _WorkoutNotesDetailsState();
}

class _WorkoutNotesDetailsState extends State<WorkoutNotesDetails> {
  final TextEditingController notes = TextEditingController();

  @override
  void initState() {
    super.initState();
    notes.text = widget.workoutDay.notes ?? '';
  }

  @override
  void dispose() {
    notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Workout Notes'),
      content: TextField(
        controller: notes,
        decoration: const InputDecoration(hintText: 'Enter workout notes...'),

        onChanged: (value) {
          setState(() {
            notes.text = value;
          });
        },
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            widget.workoutDay.notes = notes.text;
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
