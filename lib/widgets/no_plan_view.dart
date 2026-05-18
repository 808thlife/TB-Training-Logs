import 'package:flutter/material.dart';

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
            onPressed: () {},
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
