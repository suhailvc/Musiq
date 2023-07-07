//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/Functions/Play_Music.dart';
import 'package:project_music_player/Screens/main_player/MainPlayer.dart';
import 'package:project_music_player/Screens/Play%20List/Functions/PlayListSongList.dart';
import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
import 'package:project_music_player/Screens/Play%20List/SubScreen/PlayListBottomSheet.dart';
import 'package:project_music_player/Screens/mini_player/MiniPlayer.dart';
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
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: PlayListNotifier,
                  builder: (context, PlayListSongs, _) {
                    return PlayListNotifier.value[widget.idx].container.isEmpty
                        ? const Center(
                            child: Text('No Songs'),
                          )
                        : ListView.builder(
                            itemCount:
                                PlayListSongs[widget.idx].container.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  playMusic(
                                      index,
                                      PlayListNotifier
                                          .value[widget.idx].container);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    // playingList.add(Audio(songAll[index].url!));
                                    return ValueListenableBuilder(
                                      valueListenable: favDbObject.listenable(),
                                      builder: (context, value, child) {
                                        return MainPlayer(
                                          id: 1,
                                          // isFav: true,
                                        );
                                      },
                                    );
                                  }));
                                },
                                child: PlayListSongList(
                                    idx: widget.idx,
                                    song: PlayListNotifier
                                        .value[widget.idx].container[index],
                                    //name:
                                    //PlayListNotifier.value[widget.idx].name,
                                    name: widget.title,
                                    index: index,
                                    id: PlayListSongs[widget.idx]
                                        .container[index]
                                        .id!,
                                    songName: PlayListSongs[widget.idx]
                                            .container[index]
                                            .name ??
                                        'unknown',
                                    artistName: PlayListSongs[widget.idx]
                                            .container[index]
                                            .artist ??
                                        'unknown'),
                              );
                            },
                          );
                  }),
            ),
          ],
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }
}
