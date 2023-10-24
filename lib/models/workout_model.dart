import 'package:gym_tracker/models/reps_sets_weights_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'workout.g.dart';

@HiveType(typeId: 0)
class Workout extends HiveObject {
  // 19:45  18.10.2023  Chest
  @HiveField(0)
  final String time;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final List<RepsSetsWeights> repsSetsWeights;
  //static var workouts = [];

  Workout({
    required this.time,
    required this.date,
    required this.repsSetsWeights,
  });
}
