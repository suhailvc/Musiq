import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/play_list_song_bloc/play_list_song_bloc.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';
import 'package:project_music_player/presentation/play_list/main_screen/play_list.dart';
import 'package:project_music_player/presentation/play_list/sub_screen/play_list_songs.dart';
//import 'package:project_music_player/Screens/play_list/main_Ssreen/play_list.dart';
import 'package:project_music_player/presentation/splash_screen/splash_screen.dart';

// ignore: must_be_immutable
class PlayListAllSongs extends StatefulWidget {
  String songName;
  int index;
  String playListName;
  int idx;
  PlayListAllSongs(
      {required this.songName,
      required this.idx,
      required this.index,
      required this.playListName,
      super.key});

  @override
  State<PlayListAllSongs> createState() => _PlayListAllSongsState();
}

class _PlayListAllSongsState extends State<PlayListAllSongs> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 165, 150, 150),
        child: Icon(Icons.music_note),
      ),
      title: Text(
        widget.songName,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: BlocBuilder<PlayListSongBloc, PlayListSongState>(
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                // setState(() {
                if (!state.playListSongBloc[widget.idx].container
                    .contains(songAll[widget.index])) {
                  // addSongToPlayList(songAll[widget.index], widget.playListName);
                  context.read<PlayListSongBloc>().add(AddSongToPlayListBloc(
                      songAll[widget.index], widget.playListName));
                  playListNotifier[widget.idx]
                      .container
                      .insert(0, songAll[widget.index]);
                } else {
                  //removeSongfromPlayList(songAll[widget.index], widget.playListName);
                  context.read<PlayListSongBloc>().add(
                      RemoveSongFromPlayListBloc(
                          songAll[widget.idx], widget.playListName));
                  playListNotifier[widget.idx]
                      .container
                      .remove(songAll[widget.index]);
                }
                // });
              },
              child: !playListNotifier[widget.idx]
                      .container
                      .contains(songAll[widget.index])
                  ? const Icon(Icons.add)
                  : const Icon(Icons.remove));
        },
      ),
    );
  }
}

// Widget playListAllSongs(
//     String songName, int index, String playListName, int idx) {
//   return ListTile(
//     leading: const CircleAvatar(
//       backgroundColor: Color.fromARGB(255, 165, 150, 150),
//       child: Icon(Icons.music_note),
//     ),
//     title: Text(
//       songName,
//       overflow: TextOverflow.ellipsis,
//     ),
//     trailing: GestureDetector(
//         onTap: () {
//           if (!PlayListNotifier.value[idx].container.contains(songAll[index])) {
//             PlayListNotifier.value[idx].container.insert(0, songAll[index]);
//             addSongToPlayList(songAll[index], playListName);
//           } else {
//             PlayListNotifier.value[idx].container.remove(songAll[index]);
//             removeSongfromPlayList(songAll[index], playListName);
//           }
//         },
//         child: !PlayListNotifier.value[idx].container.contains(songAll[index])
//             ? Icon(Icons.add)
//             : Icon(Icons.remove)),
//   );
// }
