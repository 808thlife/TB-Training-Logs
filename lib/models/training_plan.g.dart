// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingPlanAdapter extends TypeAdapter<TrainingPlan> {
  @override
  final typeId = 0;

  @override
  TrainingPlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingPlan(
      id: fields[0] as String?,
      name: fields[1] as String,
      startDate: fields[2] as DateTime,
      endDate: fields[3] as DateTime,
      priority: (fields[4] as num).toInt(),
      status: fields[5] as PlanStatus,
      schedule: (fields[6] as List).cast<WorkoutDay>(),
    );
  }

  @override
  void write(BinaryWriter writer, TrainingPlan obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.schedule);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingPlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
