import 'package:hive_flutter/hive_flutter.dart';
part 'Model.g.dart';

@HiveType(typeId: 2)
class SongDetails {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? artist;
  @HiveField(2)
  final int? duration;
  @HiveField(3)
  final int? id;
  @HiveField(4)
  final String? url;

  SongDetails({
    required this.name,
    required this.artist,
    required this.duration,
    required this.id,
    required this.url,
  });
}
