// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentlyPlayedModelAdapter extends TypeAdapter<RecentlyPlayedModel> {
  @override
  final int typeId = 5;

  @override
  RecentlyPlayedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentlyPlayedModel(
      name: fields[0] as String?,
      artist: fields[1] as String?,
      duration: fields[2] as int?,
      id: fields[3] as int?,
      url: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecentlyPlayedModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentlyPlayedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
