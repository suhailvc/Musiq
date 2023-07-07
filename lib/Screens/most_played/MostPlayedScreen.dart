import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_music_player/DataBase/Functions/most_played/most_played_function.dart';
import 'package:project_music_player/DataBase/Model/most_played/most_played_model.dart';
//import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Functions/Play_Music.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/main_player/MainPlayer.dart';
import 'package:project_music_player/Screens/mini_player/MiniPlayer.dart';
import 'package:project_music_player/widgets/FavouritesScreen/SongsList.dart';
//import 'package:project_music_player/widgets/FavouritesScreen/SongsList.dart';

class MostPlayedScreen extends StatefulWidget {
  const MostPlayedScreen({super.key});

  @override
  State<MostPlayedScreen> createState() => _MostPlayedScreenState();
}

class _MostPlayedScreenState extends State<MostPlayedScreen> {
  List<MostPlayedModel> mostPlayedList = sortMostPlayedSong();

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
          'Most Played',
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
          child: ValueListenableBuilder(
            valueListenable: mostPlayedDb.listenable(),
            builder: (context, value, child) {
              tempList = mostPlayedList
                  .map((e) => SongDetails(
                      name: e.songName,
                      artist: e.artist,
                      duration: e.duration,
                      id: e.songId,
                      url: e.url))
                  .toList();
              return ListView.builder(
                itemCount: tempList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      playMusic(index, tempList);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ValueListenableBuilder(
                            valueListenable: mostPlayedDb.listenable(),
                            builder: (context, value, child) {
                              return MainPlayer(id: 1);
                            },
                          );
                        },
                      ));
                    },
                    child: SongsList(
                        song: tempList[index],
                        index: index,
                        id: tempList[index].id!,
                        songName: tempList[index].name ?? 'unknown',
                        artistName: tempList[index].artist ?? 'unknow'),
                  );
                },
              );
            },
          )),
      bottomSheet: const MiniPlayer(),
    );
  }
}

List<SongDetails> tempList = [];
