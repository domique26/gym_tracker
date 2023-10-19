class RepsSetsWeights {
  final int reps, sets;
  final int weight;
  final String exercise;

  RepsSetsWeights({
    required this.reps,
    required this.sets,
    required this.weight,
    required this.exercise,
  });
}

class Workout {
  /*static List workouts = [
    ["Mon.", "Chest", 60],
    ["Wed.", "Legs", 75],
    ["Mon.", "Back", 60],
    ["Wed.", "18.10.2023", 75],
  ];*/
  // 19:45  18.10.2023  Chest
  final String time, date;
  final List<RepsSetsWeights> repsSetsWeights;

  static var workouts = [
    Workout(
      time: "20:23",
      date: "19.10.2023",
      repsSetsWeights: [
        RepsSetsWeights(
          reps: 7,
          sets: 3,
          weight: 70,
          exercise: "Legpress",
        ),
        RepsSetsWeights(
          reps: 7,
          sets: 3,
          weight: 70,
          exercise: "Biceps",
        ),
      ],
    )
  ];

  Workout({
    required this.time,
    required this.date,
    required this.repsSetsWeights,
  });
}
