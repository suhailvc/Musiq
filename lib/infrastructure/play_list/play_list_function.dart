import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_music_player/infrastructure/play_list/each_play_list.dart';
import 'package:project_music_player/domain/db_model/play_list/play_list.dart';

import 'package:project_music_player/model/song_details_model.dart';
//import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
import 'package:project_music_player/presentation/play_list/main_screen/play_list.dart';
import 'package:project_music_player/presentation/splash_screen/splash_screen.dart';

// ValueNotifier<List<PlayListModel>> playListName = ValueNotifier([]);
List<EachPlayList> playListNotifier = [];

createPlayList(String name) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  playListDb.add(PlayListModel(playListName: name));
  playListNotifier.add(EachPlayList(name: name));
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  //playListNotifier.notifyListeners();
}

deletePlayList(int index) async {
  //String playListname = playListNotifier.value[index].name;
  String playListname = playListNotifier[index].name;
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playListName == playListname) {
      var key = element.key;
      playListDb.delete(key);
      break;
    }
  }
  // playListNotifier.value.removeAt(index);
  playListNotifier.removeAt(index);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  // playListNotifier.notifyListeners();
}

getPlayList() async {
  // playListNotifier.value.clear();
  playListNotifier.clear();
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (PlayListModel element in playListDb.values) {
    String playListName = element.playListName;
    EachPlayList playlistfetch = EachPlayList(name: playListName);
    for (int id in element.items) {
      for (SongDetails song in songAll) {
        if (id == song.id) {
          playlistfetch.container.add(song);
          break;
        }
      }
    }
    // playListNotifier.value.add(playlistfetch);
    playListNotifier.add(playlistfetch);
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  // playListNotifier.notifyListeners();
}

addSongToPlayList(SongDetails addingSong, String playListName) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playListName == playListName) {
      var key = element.key;
      PlayListModel updatePlayList = PlayListModel(playListName: playListName);
      updatePlayList.items.addAll(element.items);
      updatePlayList.items.add(addingSong.id!);
      playListDb.put(key, updatePlayList);

      break;
    }
  }
  // await playListFetch();
  //return playListNotifier;
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  // playListNotifier.notifyListeners();
}

removeSongfromPlayList(SongDetails removingSong, String playListName) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playListName == playListName) {
      var key = element.key;
      PlayListModel updatePlayList = PlayListModel(playListName: playListName);
      for (var item in element.items) {
        if (item == removingSong.id) {
          continue;
        }
        updatePlayList.items.add(item);
      }
      playListDb.put(key, updatePlayList);
      break;
    }
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  // playListNotifier.notifyListeners();
  // await playListFetch();
  // return playListNotifier;
}

playListRename(int index, String newName) async {
  // String playListName = playListNotifier.value[index].name;
  String playListName = playListNotifier[index].name;
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playListName == playListName) {
      var key = element.key;
      element.playListName = newName;
      playListDb.put(key, element);
    }
  }
  // playListNotifier.value[index].name = newName;
  playListNotifier[index].name = newName;
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
//  playListNotifier.notifyListeners();
}

// playListFetch() async {
//   final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
//   // Box<PlaylistClass> playlistdb = await Hive.openBox('playlist');
//   // List<EachPlaylist> playlist = [];
//   for (PlayListModel elements in playListDb.values) {
//     String playlistname = elements.playListName;
//     EachPlayList playlistfetch = EachPlayList(name: playlistname);
//     for (int id in elements.items) {
//       for (SongDetails songs in songAll) {
//         if (id == songs.id) {
//           playlistfetch.container.add(songs);
//           break;
//         }
//       }
//     }
//     playListNotifier.add(playlistfetch);
//   }
//   //return playListNotifier;
// }
