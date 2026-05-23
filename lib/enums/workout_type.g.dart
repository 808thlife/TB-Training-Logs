// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutTypeAdapter extends TypeAdapter<WorkoutType> {
  @override
  final typeId = 11;

  @override
  WorkoutType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WorkoutType.strength;
      case 1:
        return WorkoutType.easyRun;
      case 2:
        return WorkoutType.speedSession;
      case 3:
        return WorkoutType.longRun;
      case 4:
        return WorkoutType.rest;
      default:
        return WorkoutType.strength;
    }
  }

  @override
  void write(BinaryWriter writer, WorkoutType obj) {
    switch (obj) {
      case WorkoutType.strength:
        writer.writeByte(0);
      case WorkoutType.easyRun:
        writer.writeByte(1);
      case WorkoutType.speedSession:
        writer.writeByte(2);
      case WorkoutType.longRun:
        writer.writeByte(3);
      case WorkoutType.rest:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
