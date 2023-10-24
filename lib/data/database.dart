import 'package:hive/hive.dart';

Database db = Database();

class Database {
  List<dynamic> workouts = [];

  var db = Hive.box("workouts_db");

  void initData() {
    workouts = [];
  }

  void loadData() {
    workouts = db.get("workouts");
  }

  void updateDatabase() {
    db.put("workouts", workouts);
  }
}
