import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
//import 'package:on_audio_query/on_audio_query.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:project_music_player/Functions/AllSongs/All_Songs_Function.dart';
import 'package:project_music_player/Functions/AllSongs/song_fetching.dart';
//import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Model/FavouriteModel.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/widgets/BottomBar.dart';

//List<SongDetails> listOfSongs = [];
List<SongDetails> songAll = allSongDb.values.toList();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SongFetch fetch = SongFetch();
    fetch.fetching();
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/images/Splash Screen.jpg',
          fit: BoxFit.fill,
        )),
        const Center(
          child: Text(
            'MUSIQ',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        )
      ],
    ));
  }

  goToHome() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ));
    });
  }
}
