import 'package:flutter/material.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/Play%20List/Functions/PlayListPopUp.dart';
//import 'package:project_music_player/widgets/PopUp.dart';

// ignore: must_be_immutable
class PlayListSongList extends StatefulWidget {
  int idx;
  String name;
  SongDetails song;
  String songName;
  String artistName;
  int id;
  int index;
  PlayListSongList(
      {required this.idx,
      required this.name,
      required this.song,
      required this.index,
      required this.id,
      required this.songName,
      required this.artistName,
      super.key});

  @override
  State<PlayListSongList> createState() => _PlayListSongListState();
}

class _PlayListSongListState extends State<PlayListSongList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
        leading: Container(
          width: size.width * 0.14,
          height: size.height * 0.1,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 139, 131, 131),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.music_note,
            color: Colors.white,
            size: size.width * 0.08,
          ),
        ),
        title: Text(
          widget.songName,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          widget.artistName,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         removeFromFav(widget.id);
            //         favouritesSongs.value.remove(widget.id);
            //       });
            //     },
            //     child: Icon(Icons.favorite, color: Colors.red)),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (favDbObject.values
                        .where((element) => element.songId == widget.id)
                        .isEmpty) {
                      addTofavourite(widget.id);
                    } else {
                      removeFromFav(widget.id);
                    }
                  });
                },
                icon: favDbObject.values
                        .where((element) => element.songId == widget.id)
                        .isEmpty
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite, color: Colors.red)),
            const SizedBox(width: 18),
            // PopUp(ctx: context, song: widget.song)
            playListPopUp(
                idx: widget.idx,
                index: widget.index,
                ctx: context,
                PlayListName: widget.name,
                song: widget.song)
          ],
        ));
  }
}
