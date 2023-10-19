import 'package:flutter/material.dart';
import 'package:gym_tracker/pages/training_detail.dart';
import 'package:gym_tracker/utils/trainings_tile.dart';
import 'package:gym_tracker/utils/workout.dart';

// ignore: must_be_immutable
class TrainingsPage extends StatefulWidget {
  const TrainingsPage({super.key});

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  List workouts = Workout.workouts;

  void viewDetail(RepsSetsWeights repsSetsWeights) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingDetail(
          repsSetsWeights: repsSetsWeights,
        ),
      ),
    );
  }

  void deleteWorkout(int index) {
    setState(() {
      Workout.workouts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Workout.workouts.isEmpty) {
      return const Center(
        child: Text(
          "EMPTY :c\n",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        return TrainingTile(
          weekday: Workout.workouts[index].date,
          date: Workout.workouts[index].exercise,
          duration: Workout.workouts[index].reps,
          index: index,
          viewDetail: () {
            viewDetail(Workout.workouts[index]);
          },
          delete: () {
            deleteWorkout(index);
          },
        );
      },
    );
  }
}
