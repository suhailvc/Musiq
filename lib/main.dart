//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_music_player/DataBase/Functions/most_played/most_played_function.dart';
import 'package:project_music_player/DataBase/Functions/recently_played/recently_played_function.dart';
import 'package:project_music_player/DataBase/Model/PlayList/PlayList.dart';
import 'package:project_music_player/DataBase/Model/most_played/most_played_model.dart';
import 'package:project_music_player/DataBase/Model/recently_played_model/recently_played_model.dart';

import 'package:project_music_player/Functions/AllSongs/All_Songs_Function.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Data_Base/Functions/AllSongs/All_Songs_Function.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Model/FavouriteModel.dart';
import 'package:project_music_player/Model/Model.dart';
//import 'package:project_music_player/Screens/Play%20List/SubScreen/allSongsPLAdd.dart';
//import 'package:project_music_player/Screens/Favourites.dart';
// import 'package:project_music_player/Screens/HomeScreen.dart';
// import 'package:project_music_player/Screens/HomeScreen1.dart';
// import 'package:project_music_player/Screens/MainPlayer.dart';
// import 'package:project_music_player/Screens/MostPlayedScreen.dart';
// import 'package:project_music_player/Screens/PlayList.dart';
// import 'package:project_music_player/Screens/RecentlyPlayedScreen.dart';
// import 'package:project_music_player/Screens/Search.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';

//import 'package:project_music_player/widgets/BottomBar.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(FavouriteModelAdapter().typeId)) {
    Hive.registerAdapter(FavouriteModelAdapter());
  }
  if (!Hive.isAdapterRegistered(SongDetailsAdapter().typeId)) {
    Hive.registerAdapter(SongDetailsAdapter());
  }
  if (!Hive.isAdapterRegistered(PlayListModelAdapter().typeId)) {
    Hive.registerAdapter(PlayListModelAdapter());
  }
  if (!Hive.isAdapterRegistered(MostPlayedModelAdapter().typeId)) {
    Hive.registerAdapter(MostPlayedModelAdapter());
  }
  if (!Hive.isAdapterRegistered(RecentlyPlayedModelAdapter().typeId)) {
    Hive.registerAdapter(RecentlyPlayedModelAdapter());
  }
  openFav();
  await openAllSong();
  openRecentlyPlayedDb();
  openMostPlayedDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // brightness: Brightness.dark,
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          textTheme: Theme.of(context)
              .textTheme
              .apply(displayColor: Colors.white, bodyColor: Colors.white)),
      home: const SplashScreen(),
      // home: AllSongsaPLAdding(),
    );
  }
}
