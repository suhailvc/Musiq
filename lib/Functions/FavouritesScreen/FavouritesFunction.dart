import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/Model/FavouriteModel.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';
//import 'package:project_music_player/widgets/HomeScreen/AllSongs.dart';

ValueNotifier<List<SongDetails>> favouritesSongs = ValueNotifier([]);
addTofavourite(int id) async {
  final favDb = await Hive.openBox<FavouriteModel>('favouriteDB');
  await favDb.put(id, FavouriteModel(songId: id));
  for (var element in songAll) {
    if (id == element.id) {
      favouritesSongs.value.add(element);
    }
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favouritesSongs.notifyListeners();
}

Future<bool> isContains(int id) async {
  favDbObject = await Hive.openBox<FavouriteModel>('favouriteDB');
  if (favDbObject.containsKey(id)) {
    return true;
  } else {
    return false;
  }
}

late Box<FavouriteModel> favDbObject;
openFav() async {
  favDbObject = await Hive.openBox<FavouriteModel>('favouriteDB');
}

removeFromFav(int id) async {
  final favDb = await Hive.openBox<FavouriteModel>('favouriteDB');
  await favDb.delete(id);
  for (var element in songAll) {
    if (id == element.id) {
      favouritesSongs.value.remove(element);
    }
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favouritesSongs.notifyListeners();
}

favFetch() async {
  favouritesSongs.value.clear();
  List<FavouriteModel> favSongCheck = [];
  final favDb = await Hive.openBox<FavouriteModel>('favouriteDB');
  favSongCheck.addAll(favDb.values);
  for (var favs in favSongCheck) {
    int count = 0;
    for (var songs in songAll) {
      if (favs.songId == songs.id) {
        // favouritesSongs.value.add(songs);
        favouritesSongs.value.add(songs);
        break;
      } else {
        count++;
      }
    }
    if (count == songAll.length) {
      var key = favs.key;
      favDb.delete(key);
    }
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favouritesSongs.notifyListeners();
}
