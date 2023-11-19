// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingDayAdapter extends TypeAdapter<TrainingDay> {
  @override
  final int typeId = 2;

  @override
  TrainingDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingDay(
      day: fields[0] as String,
      trainigsType: fields[1] as String,
      workouts: (fields[2] as List).cast<Workout>(),
    );
  }

  @override
  void write(BinaryWriter writer, TrainingDay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.trainigsType)
      ..writeByte(2)
      ..write(obj.workouts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
