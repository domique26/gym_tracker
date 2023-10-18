import 'package:flutter/material.dart';
import 'package:gym_tracker/pages/training_detail.dart';
import 'package:gym_tracker/utils/trainings_tile.dart';
import 'package:gym_tracker/utils/workouts.dart';

// ignore: must_be_immutable
class TrainingsPage extends StatefulWidget {
  TrainingsPage({super.key});

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  List workouts = Workouts.workouts;

  void viewDetail() {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingDetail(
          weekday: weekday,
          date: date,
        ),
      ),
    );*/
  }

  void deleteWorkout(int index) {
    setState(() {
      Workouts.workouts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Workouts.workouts.isEmpty) {
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
          weekday: workouts[index][0],
          date: workouts[index][1],
          duration: workouts[index][2],
          index: index,
          viewDetail: () {
            viewDetail();
          },
          delete: () {
            deleteWorkout(index);
          },
        );
      },
    );
  }
}
