import 'package:flutter/material.dart';
import 'package:gym_tracker/utils/workout.dart';

class TrainingDetail extends StatelessWidget {
  final RepsSetsWeights repsSetsWeights;

  const TrainingDetail({
    super.key,
    required this.repsSetsWeights,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text(
          "Workout Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: detailBody(context),
    );
  }

  Column detailBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repsSetsWeights.date,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 1.15,
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.battery_4_bar,
                    color: Colors.white,
                    size: 40,
                  ),
                  title: Text(
                    "Back Day",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
