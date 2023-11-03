import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/model/song_details_model.dart';

late Box<SongDetails> allSongDb;
openAllSong() async {
  allSongDb = await Hive.openBox<SongDetails>('all_song_DB');
}
