//import 'dart:html';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/Functions/AllSongs/All_Songs_Function.dart';
import 'package:project_music_player/Model/Model.dart';

class SongFetch {
  final OnAudioQuery audioQuery = OnAudioQuery();
  permissionRequest() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  fetching() async {
    bool status = await permissionRequest();
    if (status) {
      List<SongModel> fetchSong = await audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL);
      for (SongModel element in fetchSong) {
        if (element.fileExtension == 'mp3' &&
            allSongDb.values
                .where((data) => data.name == element.displayNameWOExt)
                .isEmpty) {
          await allSongDb.add(SongDetails(
            name: element.displayNameWOExt,
            artist: element.artist,
            duration: element.duration,
            id: element.id,
            url: element.uri,
          ));
        }
      }
    }
  }
}
