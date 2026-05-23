// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushExercisesAdapter extends TypeAdapter<PushExercises> {
  @override
  final typeId = 20;

  @override
  PushExercises read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PushExercises.bp;
      case 1:
        return PushExercises.ohp;
      case 2:
        return PushExercises.dips;
      default:
        return PushExercises.bp;
    }
  }

  @override
  void write(BinaryWriter writer, PushExercises obj) {
    switch (obj) {
      case PushExercises.bp:
        writer.writeByte(0);
      case PushExercises.ohp:
        writer.writeByte(1);
      case PushExercises.dips:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushExercisesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PullExercisesAdapter extends TypeAdapter<PullExercises> {
  @override
  final typeId = 21;

  @override
  PullExercises read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PullExercises.pu;
      case 1:
        return PullExercises.br;
      case 2:
        return PullExercises.lp;
      default:
        return PullExercises.pu;
    }
  }

  @override
  void write(BinaryWriter writer, PullExercises obj) {
    switch (obj) {
      case PullExercises.pu:
        writer.writeByte(0);
      case PullExercises.br:
        writer.writeByte(1);
      case PullExercises.lp:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PullExercisesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LegsExercisesAdapter extends TypeAdapter<LegsExercises> {
  @override
  final typeId = 22;

  @override
  LegsExercises read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LegsExercises.bsq;
      case 1:
        return LegsExercises.frsq;
      case 2:
        return LegsExercises.beltsq;
      default:
        return LegsExercises.bsq;
    }
  }

  @override
  void write(BinaryWriter writer, LegsExercises obj) {
    switch (obj) {
      case LegsExercises.bsq:
        writer.writeByte(0);
      case LegsExercises.frsq:
        writer.writeByte(1);
      case LegsExercises.beltsq:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LegsExercisesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeadliftAdapter extends TypeAdapter<Deadlift> {
  @override
  final typeId = 23;

  @override
  Deadlift read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Deadlift.df;
      default:
        return Deadlift.df;
    }
  }

  @override
  void write(BinaryWriter writer, Deadlift obj) {
    switch (obj) {
      case Deadlift.df:
        writer.writeByte(0);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeadliftAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
