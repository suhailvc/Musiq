import 'package:flutter/material.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';
import 'package:project_music_player/widgets/playList/PlayListAllSongs.dart';

playListBottomSheet(BuildContext context, playListName1, int idx) async {
  return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      context: context,
      builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Color.fromARGB(255, 9, 89, 155),
          ),
          child: ListView.builder(
            itemCount: songAll.length,
            itemBuilder: (context, index) {
              return PlayListAllSongs(
                  songName: songAll[index].name ?? "unknown",
                  idx: idx,
                  index: index,
                  playListName: playListName1);
              // playListAllSongs(
              //     songAll[index].name ?? "unknown", index, playListName1, idx);
            },
          )));
}
