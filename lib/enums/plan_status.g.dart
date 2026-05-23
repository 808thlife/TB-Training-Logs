// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanStatusAdapter extends TypeAdapter<PlanStatus> {
  @override
  final typeId = 10;

  @override
  PlanStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PlanStatus.active;
      case 1:
        return PlanStatus.completed;
      case 2:
        return PlanStatus.archived;
      default:
        return PlanStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, PlanStatus obj) {
    switch (obj) {
      case PlanStatus.active:
        writer.writeByte(0);
      case PlanStatus.completed:
        writer.writeByte(1);
      case PlanStatus.archived:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
