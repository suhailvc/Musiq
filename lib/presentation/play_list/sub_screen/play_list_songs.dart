//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/application/play_list_song_bloc/play_list_song_bloc.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';
//import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/infrastructure/play_music/play_music.dart';
import 'package:project_music_player/presentation/main_player/main_player.dart';
import 'package:project_music_player/presentation/play_list/functions/play_list_song_list.dart';
import 'package:project_music_player/presentation/play_list/main_screen/play_list.dart';
import 'package:project_music_player/presentation/play_list/sub_screen/play_list_bottom_sheet.dart';
import 'package:project_music_player/presentation/mini_player/mini_player.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';
//import 'package:project_music_player/widgets/FavouritesScreen/SongsList.dart';
//import 'package:project_music_player/widgets/HomeScreen/AllSongs.dart';

// ignore: must_be_immutable
class PlayListSongs extends StatefulWidget {
  String title;
  int idx;
  PlayListSongs({required this.idx, required this.title, super.key});

  @override
  State<PlayListSongs> createState() => _PlayListSongsState();
}

class _PlayListSongsState extends State<PlayListSongs> {
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
        title: Text(
          widget.title,
          style: const TextStyle(
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
        actions: [
          IconButton(
              onPressed: () {
                playListBottomSheet(context, widget.title, widget.idx);
              },
              icon: const Icon(Icons.add))
        ],
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
            Expanded(child: // ValueListenableBuilder(
                    //  valueListenable: playListNotifier,
                    //  builder: (context, playListSongss, _) {return
                    BlocBuilder<PlayListSongBloc, PlayListSongState>(
              builder: (context, state) {
                return state.playListSongBloc[widget.idx].container.isEmpty
                    ? const Center(
                        child: Text('No Songs'),
                      )
                    : ListView.builder(
                        itemCount:
                            state.playListSongBloc[widget.idx].container.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              playMusic(index,
                                  state.playListSongBloc[widget.idx].container);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                // playingList.add(Audio(songAll[index].url!));
                                //return ValueListenableBuilder(
                                //valueListenable: favDbObject.listenable(),
                                //builder: (context, value, child) {
                                return MainPlayer(
                                  id: 1,
                                  // isFav: true,
                                );
                                // },
                                // );
                              }));
                            },
                            child: PlayListSongList(
                                idx: widget.idx,
                                song: state.playListSongBloc[widget.idx]
                                    .container[index],
                                //name:
                                //PlayListNotifier.value[widget.idx].name,
                                name: widget.title,
                                index: index,
                                id: state.playListSongBloc[widget.idx]
                                    .container[index].id!,
                                songName: state.playListSongBloc[widget.idx]
                                        .container[index].name ??
                                    'unknown',
                                artistName: state.playListSongBloc[widget.idx]
                                        .container[index].artist ??
                                    'unknown'),
                          );
                        },
                      );
              },
            )
                //  }),
                ),
          ],
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }
}
