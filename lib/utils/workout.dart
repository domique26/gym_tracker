class RepsSetsWeights {
  final String reps, sets;
  final String weight;
  final String exercise;

  RepsSetsWeights({
    required this.reps,
    required this.sets,
    required this.weight,
    required this.exercise,
  });
}

class Workout {
  // 19:45  18.10.2023  Chest
  final String time, date;
  final List<RepsSetsWeights> repsSetsWeights;

  static var workouts = [];

  Workout({
    required this.time,
    required this.date,
    required this.repsSetsWeights,
  });
}
