// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_time_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutTimeStatusAdapter extends TypeAdapter<WorkoutTimeStatus> {
  @override
  final typeId = 12;

  @override
  WorkoutTimeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WorkoutTimeStatus.past;
      case 1:
        return WorkoutTimeStatus.today;
      case 2:
        return WorkoutTimeStatus.future;
      default:
        return WorkoutTimeStatus.past;
    }
  }

  @override
  void write(BinaryWriter writer, WorkoutTimeStatus obj) {
    switch (obj) {
      case WorkoutTimeStatus.past:
        writer.writeByte(0);
      case WorkoutTimeStatus.today:
        writer.writeByte(1);
      case WorkoutTimeStatus.future:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutTimeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
