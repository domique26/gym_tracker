import 'package:gym_tracker/models/workout_model.dart';
import 'package:hive/hive.dart';

part 'training_day_model.g.dart';

@HiveType(typeId: 2)
class TrainingDay {
  @HiveField(0)
  final String day;
  @HiveField(1)
  String trainigsType;
  @HiveField(2)
  final List<Workout> workouts;

  TrainingDay({
    required this.day,
    required this.trainigsType,
    required this.workouts,
  });
}
