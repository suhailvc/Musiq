import 'package:flutter/material.dart';
import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';

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
      trailing: GestureDetector(
          onTap: () {
            setState(() {
              if (!PlayListNotifier.value[widget.idx].container
                  .contains(songAll[widget.index])) {
                PlayListNotifier.value[widget.idx].container
                    .insert(0, songAll[widget.index]);
                addSongToPlayList(songAll[widget.index], widget.playListName);
              } else {
                PlayListNotifier.value[widget.idx].container
                    .remove(songAll[widget.index]);
                removeSongfromPlayList(
                    songAll[widget.index], widget.playListName);
              }
            });
          },
          child: !PlayListNotifier.value[widget.idx].container
                  .contains(songAll[widget.index])
              ? const Icon(Icons.add)
              : const Icon(Icons.remove)),
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
