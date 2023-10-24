// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reps_sets_weights_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepsSetsWeightsAdapter extends TypeAdapter<RepsSetsWeights> {
  @override
  final int typeId = 1;

  @override
  RepsSetsWeights read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepsSetsWeights(
      reps: fields[0] as String,
      sets: fields[1] as String,
      weight: fields[2] as String,
      exercise: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RepsSetsWeights obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.reps)
      ..writeByte(1)
      ..write(obj.sets)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.exercise);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepsSetsWeightsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
