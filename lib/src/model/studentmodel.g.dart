// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelstudentAdapter extends TypeAdapter<Modelstudent> {
  @override
  final int typeId = 1;

  @override
  Modelstudent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Modelstudent(
      name: fields[1] as String,
      id: fields[0] as int?,
      age: fields[2] as String,
      place: fields[3] as String,
      number: fields[4] as String,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Modelstudent obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.place)
      ..writeByte(4)
      ..write(obj.number)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelstudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
