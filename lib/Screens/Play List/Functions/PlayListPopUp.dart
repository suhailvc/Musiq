import 'package:flutter/material.dart';
import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
//import 'package:project_music_player/Screens/Play%20List/SubScreen/allSongsPLAdd.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';

Widget playListPopUp(
    {required int idx,
    required int index,
    required BuildContext ctx,
    required SongDetails song,
    required String PlayListName}) {
  return PopupMenuButton(
    icon: const Icon(
      Icons.more_vert,
      color: Colors.white,
    ),
    color: const Color.fromARGB(255, 51, 50, 54),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    itemBuilder: (context) {
      return [
        PopupMenuItem(
            child: GestureDetector(
          onTap: () {
            removeSongfromPlayList(song, PlayListName);
            PlayListNotifier.value[idx].container.remove(song);
            Navigator.pop(context);
          },
          child: const ListTile(
            title: Text(
              'Remove From play list',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.add_outlined,
              color: Colors.white,
            ),
          ),
        ))
      ];
    },
  );
}
