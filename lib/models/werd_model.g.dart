// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'werd_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WerdAdapter extends TypeAdapter<Werd> {
  @override
  final int typeId = 1;

  @override
  Werd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Werd(
      mp3File: (fields[2] as List?)?.cast<String>(),
      werdFromTo: fields[0] as String,
      ayats: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Werd obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.werdFromTo)
      ..writeByte(1)
      ..write(obj.ayats)
      ..writeByte(2)
      ..write(obj.mp3File);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WerdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
