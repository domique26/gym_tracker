import 'package:hive_flutter/hive_flutter.dart';

part 'machine_model.g.dart';

@HiveType(typeId: 3)
class MachineType {
  @HiveField(0)
  final String type;

  MachineType({required this.type});
}

MachineType arms = MachineType(type: "Arms");
MachineType shoulders = MachineType(type: "Shoulders");
MachineType back = MachineType(type: "Back");
MachineType abs = MachineType(type: "Abs");
MachineType legs = MachineType(type: "Legs");

@HiveType(typeId: 4)
class Machine {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final MachineType type;

  Machine({required this.name, required this.type});
}
