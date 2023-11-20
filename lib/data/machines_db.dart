import 'package:gym_tracker/models/machine_model.dart';
import 'package:hive/hive.dart';

MachinesDatabase machines = MachinesDatabase();

class MachinesDatabase {
  List<Machine> maschines = [];
  var db = Hive.box("machines_db");

  void initData() {
    maschines = [
      Machine(name: "A1", type: arms),
      Machine(name: "A2", type: arms),
      Machine(name: "A3", type: arms),
      Machine(name: "B1", type: back),
      Machine(name: "B2", type: back),
      Machine(name: "B3", type: back),
      Machine(name: "C1", type: abs),
      Machine(name: "C2", type: abs),
      Machine(name: "C3", type: abs),
      Machine(name: "S1", type: shoulders),
      Machine(name: "S2", type: shoulders),
      Machine(name: "S3", type: shoulders),
      Machine(name: "L1", type: legs),
      Machine(name: "L2", type: legs),
      Machine(name: "L3", type: legs),
    ];
  }

  void loadData() {
    machines = db.get("machines");
  }

  void updateDatabase() {
    db.put("machines", machines);
  }
}
