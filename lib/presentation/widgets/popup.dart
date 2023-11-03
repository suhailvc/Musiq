import 'package:flutter/material.dart';
//import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/model/song_details_model.dart';
//import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
import 'package:project_music_player/presentation/play_list/sub_screen/all_songs_pladd.dart';

// ignore: non_constant_identifier_names
Widget PopUp({required BuildContext ctx, SongDetails? song}) {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllSongsaPLAdding(
                    song: song!,
                  ),
                ));
          },
          child: const ListTile(
            title: Text(
              'Add to play list',
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
