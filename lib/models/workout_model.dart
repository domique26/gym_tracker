import 'package:gym_tracker/models/reps_sets_weights_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'workout_model.g.dart';

@HiveType(typeId: 0)
class Workout extends HiveObject {
  @HiveField(0)
  final String time;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final List<RepsSetsWeights> repsSetsWeights;

  Workout({
    required this.time,
    required this.date,
    required this.repsSetsWeights,
  });
}
