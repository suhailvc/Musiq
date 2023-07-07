import 'package:flutter/material.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/widgets/PopUp.dart';

// ignore: must_be_immutable
class SongsList extends StatefulWidget {
  SongDetails? song;
  String songName;
  String artistName;
  int id;
  int index;
  SongsList(
      {this.song,
      required this.index,
      required this.id,
      required this.songName,
      required this.artistName,
      super.key});

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
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
                    bool isNotContain = favDbObject.values
                        .where((element) => element.songId == widget.id)
                        .isEmpty;
                    if (isNotContain) {
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
            PopUp(ctx: context, song: widget.song)
          ],
        ));
  }
}
