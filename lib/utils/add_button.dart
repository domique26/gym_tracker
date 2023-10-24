import 'package:flutter/material.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/new_training_page.dart';
import 'package:gym_tracker/pages/training_detail.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.widget,
  });

  final TrainingDetail widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: customAppBar(),
                  body: NewTrainingPage(
                    workout: widget.workout,
                  ),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: const Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
