class RepsSetsWeights {
  final int reps, sets;
  final int weight;
  final String exercise, time, date;

  RepsSetsWeights(
      {required this.reps,
      required this.sets,
      required this.weight,
      required this.exercise,
      required this.time,
      required this.date});
}

class Workouts {
  /*static List workouts = [
    ["Mon.", "Chest", 60],
    ["Wed.", "Legs", 75],
    ["Mon.", "Back", 60],
    ["Wed.", "18.10.2023", 75],
  ];*/

  // 19:45  18.10.2023  Chest
  final String time, date, type;

  static final List<RepsSetsWeights> workouts = [];

  Workouts({
    required this.time,
    required this.date,
    required this.type,
  });
}
