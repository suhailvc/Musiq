import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/application/recently_played_bloc/recently_played_bloc_bloc.dart';
import 'package:project_music_player/infrastructure/recently_played/recently_played_function.dart';
import 'package:project_music_player/domain/db_model/recently_played_model/recently_played_model.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
import 'package:project_music_player/infrastructure/play_music/play_music.dart';
//import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/model/song_details_model.dart';
import 'package:project_music_player/presentation/main_player/main_player.dart';
import 'package:project_music_player/presentation/mini_player/mini_player.dart';
import 'package:project_music_player/presentation/widgets/favourites_screen/songs_list.dart';

//import 'package:project_music_player/widgets/FavouritesScreen/SongsList.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 8, 2, 31),
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        toolbarHeight: size.height * 0.1,
        title: const Text(
          'Recently Played',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 226, 222, 222)),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade800,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(
              left: size.height * 0.02, right: size.height * 0.02),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  // stops: [0.5, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.5)
              ])),
          child:
              // ValueListenableBuilder(
              // valueListenable: recentlyPlayedDb.listenable(),
              //builder: (context, value, child) {
              // List<RecentlyPlayedModel> rPSong =
              //     recentlyPlayedDb.values.toList().reversed.toList();
              // List<SongDetails> playingSong;
              // playingSong = rPSong
              //     .map((recentlyPlayed) => SongDetails(
              //           name: recentlyPlayed.name,
              //           artist: recentlyPlayed.artist,
              //           duration: recentlyPlayed.duration,
              //           id: recentlyPlayed.id,
              //           url: recentlyPlayed.url,
              //         ))
              //     .toList();

              BlocBuilder<RecentlyPlayedBlocBloc, RecentlyPlayedBlocState>(
            builder: (context, state) {
              List<RecentlyPlayedModel> rPSong =
                  state.recentlyPlayedBloc.values.toList().reversed.toList();
              //    recentlyPlayedDb.values.toList().reversed.toList();
              List<SongDetails> playingSong;
              playingSong = rPSong
                  .map((recentlyPlayed) => SongDetails(
                        name: recentlyPlayed.name,
                        artist: recentlyPlayed.artist,
                        duration: recentlyPlayed.duration,
                        id: recentlyPlayed.id,
                        url: recentlyPlayed.url,
                      ))
                  .toList();
              return ListView.builder(
                itemCount: rPSong.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        playMusic(index, playingSong);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            //return ValueListenableBuilder(
                            //valueListenable: favDbObject.listenable(),
                            //builder: (context, value, child) {
                            return MainPlayer(
                              id: playingSong[index].id!,
                            );
                            // },
                            //);
                          },
                        ));
                      },
                      child: SongsList(
                          song: playingSong[index],
                          index: index,
                          id: rPSong[index].id!,
                          songName: rPSong[index].name ?? 'unknown',
                          artistName: rPSong[index].artist ?? 'unknown'));
                },
              );
            },
          )
          // },
          //  )
          ),
      bottomSheet: const MiniPlayer(),
    );
  }
}
