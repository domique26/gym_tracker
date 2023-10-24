import 'package:gym_tracker/models/reps_sets_weights_model.dart';
import 'package:gym_tracker/models/workout_model.dart';
import 'package:hive/hive.dart';

Database db = Database();

class Database {
  List<dynamic> workouts = [];

  var db = Hive.box("workouts_db");

  void initData() {
    workouts = [
      Workout(time: "20", date: "yyyymmdd", repsSetsWeights: [
        RepsSetsWeights(
          exercise: "a",
          reps: "b",
          sets: "c",
          weight: "d",
        ),
      ])
    ];
  }

  void loadData() {
    workouts = db.get("workouts");
  }

  void updateDatabase() {
    db.put("workouts", workouts);
  }
}
