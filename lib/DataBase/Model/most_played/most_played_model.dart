import 'package:hive_flutter/adapters.dart';
part 'most_played_model.g.dart';

@HiveType(typeId: 4)
class MostPlayedModel {
  @HiveField(0)
  int? count = 0;
  @HiveField(1)
  int? songId;
  @HiveField(2)
  String songName;
  @HiveField(3)
  String url;
  @HiveField(4)
  int duration;
  @HiveField(5)
  String artist;
  MostPlayedModel({
    required this.url,
    required this.songName,
    required this.duration,
    required this.artist,
    required this.songId,
    this.count,
  });
}
