// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_played_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostPlayedModelAdapter extends TypeAdapter<MostPlayedModel> {
  @override
  final int typeId = 4;

  @override
  MostPlayedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostPlayedModel(
      url: fields[3] as String,
      songName: fields[2] as String,
      duration: fields[4] as int,
      artist: fields[5] as String,
      songId: fields[1] as int?,
      count: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MostPlayedModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.songId)
      ..writeByte(2)
      ..write(obj.songName)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostPlayedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
