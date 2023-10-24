import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/pages/training_detail.dart';
import 'package:gym_tracker/models/trainings_tile_model.dart';
import 'package:gym_tracker/models/workout_model.dart';

// ignore: must_be_immutable
class TrainingsPage extends StatefulWidget {
  const TrainingsPage({super.key});

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  void viewDetail(Workout workout) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingDetail(
          workout: workout,
        ),
      ),
    );
  }

  void deleteWorkout(int index) {
    setState(() {
      db.workouts.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    if (db.workouts.isEmpty) {
      return const Center(
        child: Text(
          "EMPTY :c",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }
    return ListView.builder(
      itemCount: db.workouts.length,
      itemBuilder: (context, index) {
        return TrainingTile(
          workout: db.workouts[index],
          viewDetail: () {
            viewDetail(
              db.workouts[index],
            );
          },
          delete: () {
            deleteWorkout(index);
          },
        );
      },
    );
  }
}
