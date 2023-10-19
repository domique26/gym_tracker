import 'package:flutter/material.dart';
import 'package:gym_tracker/utils/workout.dart';

class TrainingDetail extends StatelessWidget {
  final Workout workout;

  const TrainingDetail({
    super.key,
    required this.workout,
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

  Widget detailBody(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: workout.repsSetsWeights.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: Colors.grey[900],
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    leading: const Icon(Icons.home, size: 40),
                    title: Text(
                      workout.repsSetsWeights[index].exercise,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Text(
                        "${workout.repsSetsWeights[index].reps} Reps    |   ${workout.repsSetsWeights[index].sets} Sets    |   ${workout.repsSetsWeights[index].weight} KG"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
