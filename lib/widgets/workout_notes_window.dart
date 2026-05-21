import 'package:flutter/material.dart';

class WorkoutNotesDetails extends StatefulWidget {
  final String notes;

  const WorkoutNotesDetails({super.key, required this.notes});

  @override
  State<WorkoutNotesDetails> createState() => _WorkoutNotesDetailsState();
}

class _WorkoutNotesDetailsState extends State<WorkoutNotesDetails> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Workout Notes'),
      content: Text(
        widget.notes.isNotEmpty ? widget.notes : 'No notes for this workout.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
