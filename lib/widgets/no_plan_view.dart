import 'package:flutter/material.dart';
import 'package:tb_training_logs/screens/create_plan.dart';

// for cases when there's no active plan. Prompts the user to create one.
class NoPlanView extends StatelessWidget {
  const NoPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Looks like there's no active plan",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePlanScreen()),
              );
            },
            label: Text("Create"),
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
    );
  }
}
