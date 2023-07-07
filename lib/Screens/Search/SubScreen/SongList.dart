import 'package:flutter/material.dart';
//import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/widgets/PopUp.dart';

// ignore: must_be_immutable
class SongList extends StatefulWidget {
  SongDetails? song;
  String songName;
  String artistName;
  int id;
  int index;
  SongList(
      {required this.id,
      required this.songName,
      required this.artistName,
      required this.index,
      required this.song,
      super.key});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
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
            //  IconButton(
            // onPressed: () {
            //   setState(() {favouritesSongs.value.[index].});
            // },
            // icon: Icon(Icons.favorite, color: Colors.red)),
            const SizedBox(width: 18),
            PopUp(ctx: context, song: widget.song)
          ],
        ));
  }
}
