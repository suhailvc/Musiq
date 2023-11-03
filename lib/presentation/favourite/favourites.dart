import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/application/favourites_bloc/favourites_bloc_bloc.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Data_Base/Functions/Play_Music.dart';

import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
import 'package:project_music_player/infrastructure/play_music/play_music.dart';
//import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/model/song_details_model.dart';
import 'package:project_music_player/presentation/main_player/main_player.dart';
import 'package:project_music_player/presentation/mini_player/mini_player.dart';
import 'package:project_music_player/presentation/splash_screen/splash_screen.dart';
import 'package:project_music_player/presentation/widgets/favourites_screen/songs_list.dart';

class FavouritesScreen extends StatelessWidget {
  SongDetails? song;
  FavouritesScreen({this.song, super.key});

  @override
  Widget build(BuildContext context) {
    // favFetch();
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
          'Favourites',
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
        child: Column(
          children: [
            Expanded(child:
                // ValueListenableBuilder(
                // valueListenable: favDbObject.listenable(),
                // builder: (context, favSongs, _) {
                //   return favSongs.isEmpty
                //       ? const Center(
                //           child: Text('No Songs'),
                //         )
                //       :
                // }),
                BlocBuilder<FavouritesBlocBloc, FavouritesBlocState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: favouritesSongs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        playMusic(index, state.fouriteSongBloc);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          playingList.add(Audio(songAll[index].url!));
                          // return ValueListenableBuilder(
                          // valueListenable: favDbObject.listenable(),
                          //builder: (context, value, child) {
                          return MainPlayer(
                            //  id: songAll[index].id!,
                            id: state.fouriteSongBloc[index].id!,
                            // isFav: contains,
                            // song: favouritesSongs[index],
                            song: state.fouriteSongBloc[index],
                          );
                          // },
                          // );
                        }));
                      },
                      child: SongsList(
                          // song: favouritesSongs[index],
                          song: state.fouriteSongBloc[index],
                          index: index,
                          // id: favouritesSongs[index].id!,
                          id: state.fouriteSongBloc[index].id!,
                          // songName: favouritesSongs[index].name!,
                          songName:
                              state.fouriteSongBloc[index].name ?? 'unknown',
                          //   artistName:
                          // favouritesSongs[index].artist ?? 'unknown'
                          artistName:
                              state.fouriteSongBloc[index].artist ?? 'unknown'),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }
}
