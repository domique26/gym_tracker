import 'package:hive/hive.dart';

SettingsDatabase settings_db = SettingsDatabase();

class SettingsDatabase {
  List<String> trainigs = [];

  var db = Hive.box("settings_db");

  void initData() {
    trainigs = [
      "Restday",
      "Chest",
      "Legs",
      "Restday",
      "Arms",
      "Restday",
      "Back"
    ];
  }

  void loadData() {
    trainigs = db.get("settings");
  }

  void updateDatabase() {
    db.put("settings", trainigs);
  }
}
