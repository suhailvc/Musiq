import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_music_player/DataBase/Functions/EachPlayList.dart';
import 'package:project_music_player/DataBase/Model/PlayList/PlayList.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';

ValueNotifier<List<PlayListModel>> PlayListName = ValueNotifier([]);

createPlayList(String name) async {
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  playListDb.add(PlayListModel(playListName: name));
  PlayListNotifier.value.add(EachPlayList(name: name));
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

deletePlayList(int index) async {
  String playListname = PlayListNotifier.value[index].name;
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playListName == playListname) {
      var key = element.key;
      playListDb.delete(key);
      break;
    }
  }
  PlayListNotifier.value.removeAt(index);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}

getPlayList() async {
  PlayListNotifier.value.clear();
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
    PlayListNotifier.value.add(playlistfetch);
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
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
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
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
  PlayListNotifier.notifyListeners();
}

playListRename(int index, String newName) async {
  String playListName = PlayListNotifier.value[index].name;
  final playListDb = await Hive.openBox<PlayListModel>('create_playlist');
  for (var element in playListDb.values) {
    if (element.playListName == playListName) {
      var key = element.key;
      element.playListName = newName;
      playListDb.put(key, element);
    }
  }
  PlayListNotifier.value[index].name = newName;
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  PlayListNotifier.notifyListeners();
}
