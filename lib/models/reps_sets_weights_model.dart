import 'package:hive/hive.dart';

part 'reps_sets_weights_model.g.dart';

@HiveType(typeId: 1)
class RepsSetsWeights extends HiveObject {
  @HiveField(0)
  final String reps;
  @HiveField(1)
  final String sets;
  @HiveField(2)
  final String weight;
  @HiveField(3)
  final String exercise;

  RepsSetsWeights({
    required this.reps,
    required this.sets,
    required this.weight,
    required this.exercise,
  });
}
