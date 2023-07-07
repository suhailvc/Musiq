import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Data_Base/Functions/Play_Music.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Functions/Play_Music.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/main_player/MainPlayer.dart';
import 'package:project_music_player/Screens/mini_player/MiniPlayer.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';
import 'package:project_music_player/widgets/FavouritesScreen/SongsList.dart';

class FavouritesScreen extends StatefulWidget {
  SongDetails? song;
  FavouritesScreen({this.song, super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
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
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: favouritesSongs,
                  builder: (context, favSongs, _) {
                    return favSongs.isEmpty
                        ? const Center(
                            child: Text('No Songs'),
                          )
                        : ListView.builder(
                            itemCount: favSongs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  playMusic(index, favouritesSongs.value);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    playingList.add(Audio(songAll[index].url!));
                                    return ValueListenableBuilder(
                                      valueListenable: favDbObject.listenable(),
                                      builder: (context, value, child) {
                                        return MainPlayer(
                                          id: songAll[index].id!,
                                          // isFav: contains,
                                          song: favSongs[index],
                                        );
                                      },
                                    );
                                  }));
                                },
                                child: SongsList(
                                    song: favSongs[index],
                                    index: index,
                                    id: favSongs[index].id!,
                                    songName: favSongs[index].name!,
                                    artistName:
                                        favSongs[index].artist ?? 'unknown'),
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
