//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_music_player/application/favourites_bloc/favourites_bloc_bloc.dart';
import 'package:project_music_player/application/most_played_bloc/most_played_bloc_bloc.dart';
import 'package:project_music_player/application/play_list_bloc/play_list_bloc.dart';
import 'package:project_music_player/application/play_list_song_bloc/play_list_song_bloc.dart';
import 'package:project_music_player/application/recently_played_bloc/recently_played_bloc_bloc.dart';
import 'package:project_music_player/application/search_bloc/search_bloc_bloc.dart';

import 'package:project_music_player/infrastructure/most_played/most_played_function.dart';
import 'package:project_music_player/infrastructure/recently_played/recently_played_function.dart';
//import 'package:project_music_player/DataBase/Model/PlayList/PlayList.dart';
import 'package:project_music_player/domain/db_model/most_played/most_played_model.dart';
import 'package:project_music_player/domain/db_model/recently_played_model/recently_played_model.dart';
import 'package:project_music_player/domain/db_model/play_list/play_list.dart';
import 'package:project_music_player/infrastructure/all_songs/all_songs_function.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/model/favourite_model.dart';
//import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/model/song_details_model.dart';
//import 'package:project_music_player/Screens/Play%20List/SubScreen/allSongsPLAdd.dart';
//import 'package:project_music_player/Screens/Favourites.dart';
// import 'package:project_music_player/Screens/HomeScreen.dart';
// import 'package:project_music_player/Screens/HomeScreen1.dart';
// import 'package:project_music_player/Screens/MainPlayer.dart';
// import 'package:project_music_player/Screens/MostPlayedScreen.dart';
// import 'package:project_music_player/Screens/PlayList.dart';
// import 'package:project_music_player/Screens/RecentlyPlayedScreen.dart';
// import 'package:project_music_player/Screens/Search.dart';
import 'package:project_music_player/presentation/splash_screen/splash_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecentlyPlayedBlocBloc>(
          create: (context) => RecentlyPlayedBlocBloc(),
        ),
        BlocProvider<MostPlayedBlocBloc>(
          create: (context) => MostPlayedBlocBloc(),
        ),
        BlocProvider<FavouritesBlocBloc>(
          create: (context) => FavouritesBlocBloc(),
        ),
        BlocProvider<PlayListBloc>(
          create: (context) => PlayListBloc(),
        ),
        BlocProvider<PlayListSongBloc>(
          create: (context) => PlayListSongBloc(),
        ),
        BlocProvider<SearchBlocBloc>(
          create: (context) => SearchBlocBloc(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            // brightness: Brightness.dark,
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.transparent),
            textTheme: Theme.of(context)
                .textTheme
                .apply(displayColor: Colors.white, bodyColor: Colors.white)),
        home: const SplashScreen(),
        // home: AllSongsaPLAdding(),
      ),
    );
  }
}
