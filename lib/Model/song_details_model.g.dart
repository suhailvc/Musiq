// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongDetailsAdapter extends TypeAdapter<SongDetails> {
  @override
  final int typeId = 2;

  @override
  SongDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongDetails(
      name: fields[0] as String?,
      artist: fields[1] as String?,
      duration: fields[2] as int?,
      id: fields[3] as int?,
      url: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SongDetails obj) {
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
      other is SongDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
