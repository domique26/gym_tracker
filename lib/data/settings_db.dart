import 'package:gym_tracker/models/training_day_model.dart';
import 'package:hive/hive.dart';

SettingsDatabase settings_db = SettingsDatabase();

class SettingsDatabase {
  List<dynamic> trainigs = [];

  var db = Hive.box("settings_db");

  void initData() {
    trainigs = [
      TrainingDay(day: "Monday", trainigsType: "Pull", workouts: []),
      TrainingDay(day: "Tuesday", trainigsType: "Push", workouts: []),
      TrainingDay(day: "Wednesday", trainigsType: "Restday", workouts: []),
      TrainingDay(day: "Thursday", trainigsType: "Pull", workouts: []),
      TrainingDay(day: "Friday", trainigsType: "Push", workouts: []),
      TrainingDay(day: "Saturday", trainigsType: "Legs", workouts: []),
      TrainingDay(day: "Sunday", trainigsType: "Restday", workouts: []),
    ];
  }

  void loadData() {
    trainigs = db.get("settings");
  }

  void updateDatabase() {
    db.put("settings", trainigs);
  }
}
