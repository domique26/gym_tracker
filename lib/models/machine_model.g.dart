// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MachineTypeAdapter extends TypeAdapter<MachineType> {
  @override
  final int typeId = 3;

  @override
  MachineType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MachineType(
      type: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MachineType obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MachineAdapter extends TypeAdapter<Machine> {
  @override
  final int typeId = 4;

  @override
  Machine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Machine(
      name: fields[0] as String,
      type: fields[1] as MachineType,
    );
  }

  @override
  void write(BinaryWriter writer, Machine obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MachineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
