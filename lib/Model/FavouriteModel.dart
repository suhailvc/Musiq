import 'package:hive_flutter/hive_flutter.dart';
part 'FavouriteModel.g.dart';

@HiveType(typeId: 1)
class FavouriteModel extends HiveObject {
  @HiveField(0)
  int songId;
  FavouriteModel({required this.songId});
}
