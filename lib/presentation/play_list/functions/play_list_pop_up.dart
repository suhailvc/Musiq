import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/play_list_song_bloc/play_list_song_bloc.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';
//import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/model/song_details_model.dart';
//import 'package:project_music_player/Screens/Play%20List/main_screen/play_list.dart';
//import 'package:project_music_player/presentation/play_list/main_screen/play_list.dart';
//import 'package:project_music_player/Screens/Play%20List/SubScreen/allSongsPLAdd.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';

Widget playListPopUp(
    {required int idx,
    required int index,
    required BuildContext ctx,
    required SongDetails song,
    required String playListName}) {
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
            ctx.read<PlayListSongBloc>().add(RemoveSongFromPlayListBloc(
                  song,
                  playListName,
                ));
            // removeSongfromPlayList(song, PlayListName);
            // playListNotifier.value[idx].container.remove(song);
            playListNotifier[idx].container.remove(song);
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
