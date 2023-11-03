import 'package:hive_flutter/adapters.dart';
import 'package:project_music_player/domain/db_model/most_played/most_played_model.dart';

late Box<MostPlayedModel> mostPlayedDb;
openMostPlayedDb() async {
  mostPlayedDb = await Hive.openBox<MostPlayedModel>('most_playedDb');
}

mostPlayedSong(MostPlayedModel song) async {
  if (mostPlayedDb.values
      .where((element) => element.songName == song.songName)
      .isEmpty) {
    mostPlayedDb.put(song.songId, song);
  } else {
    MostPlayedModel? s = mostPlayedDb.get(song.songId);
    int count = s?.count ?? 0;
    song.count = count + 1;
    await mostPlayedDb.put(song.songId, song);
  }
}

List<MostPlayedModel> sortMostPlayedSong(Box<MostPlayedModel> box) {
  List<MostPlayedModel> sortedList = box.values.toList();
  sortedList.sort((a, b) => (b.count ?? 0).compareTo(a.count ?? 0));
  List<MostPlayedModel> tempList = [];
  for (var element in sortedList) {
    if (element.count! > 6) {
      tempList.add(element);
    }
  }
  return tempList;
}

// List<MostPlayedModel> sortMostPlayedSong() {
//   List<MostPlayedModel> sortedList = mos.values.toList();
//   sortedList.sort((a, b) => (b.count ?? 0).compareTo(a.count ?? 0));
//   List<MostPlayedModel> tempList = [];
//   for (var element in sortedList) {
//     if (element.count! > 6) {
//       tempList.add(element);
//     }
//   }
//   return tempList;
// }
