import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/DataBase/Model/recently_played_model/recently_played_model.dart';
//import 'package:project_music_player/Model/Model.dart';

late Box<RecentlyPlayedModel> recentlyPlayedDb;
openRecentlyPlayedDb() async {
  recentlyPlayedDb =
      await Hive.openBox<RecentlyPlayedModel>('recently_Played_Db');
}

getRecentlyPlayed(RecentlyPlayedModel song) async {
  List<RecentlyPlayedModel> recentlyPlayedList =
      recentlyPlayedDb.values.toList();
  if (recentlyPlayedList
      .where((element) => element.name == song.name)
      .isEmpty) {
    recentlyPlayedDb.add(song);
  } else {
    int index =
        recentlyPlayedList.indexWhere((element) => element.name == song.name);
    recentlyPlayedDb.deleteAt(index);
    recentlyPlayedDb.add(song);
  }
}
