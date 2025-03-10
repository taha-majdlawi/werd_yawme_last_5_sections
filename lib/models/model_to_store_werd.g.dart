// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_to_store_werd.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WerdToStoreAdapter extends TypeAdapter<WerdToStore> {
  @override
  final int typeId = 2;

  @override
  WerdToStore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WerdToStore(
      surah: fields[0] as Surah,
      index: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WerdToStore obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.surah)
      ..writeByte(1)
      ..write(obj.index);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WerdToStoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
