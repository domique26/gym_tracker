import 'package:hive/hive.dart';

SettingsDatabase settings_db = SettingsDatabase();

class SettingsDatabase {
  List<String> trainigs = [];

  var db = Hive.box("settings_db");

  void initData() {
    trainigs = [
      "Upper Body",
      "Restday",
      "Legday",
      "Restday",
      "Upper Body",
      "Restday",
      "Restday"
    ];
  }

  void loadData() {
    trainigs = db.get("settings");
  }

  void updateDatabase() {
    db.put("settings", trainigs);
  }
}
