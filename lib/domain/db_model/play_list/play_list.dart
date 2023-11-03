import 'package:hive_flutter/adapters.dart';
//import 'package:project_music_player/Model/Model.dart';
part 'play_list.g.dart';

@HiveType(typeId: 3)
class PlayListModel extends HiveObject {
  @HiveField(0)
  String playListName;
  @HiveField(1)
  List<int> items = [];
  PlayListModel({required this.playListName});
}
