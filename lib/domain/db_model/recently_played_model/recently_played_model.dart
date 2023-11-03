import 'package:hive_flutter/adapters.dart';
part 'recently_played_model.g.dart';

@HiveType(typeId: 5)
class RecentlyPlayedModel {
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
  RecentlyPlayedModel(
      {required this.name,
      required this.artist,
      required this.duration,
      required this.id,
      required this.url});
}
