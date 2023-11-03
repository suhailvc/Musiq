import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/favourites_bloc/favourites_bloc_bloc.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
//import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/model/song_details_model.dart';
import 'package:project_music_player/presentation/widgets/popup.dart';

// ignore: must_be_immutable
class SongsList extends StatelessWidget {
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
          songName,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          artistName,
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

            BlocBuilder<FavouritesBlocBloc, FavouritesBlocState>(
                builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    // setState(() {
                    bool isNotContain = favDbObject.values
                        .where((element) => element.songId == id)
                        .isEmpty;
                    if (isNotContain) {
                      //addTofavourite(widget.id);
                      context
                          .read<FavouritesBlocBloc>()
                          .add(AddToFavouriteBloc(id: id));
                    } else {
                      //removeFromFav(widget.id);
                      context
                          .read<FavouritesBlocBloc>()
                          .add(RemoveFromFavBloc(id: id));
                    }
                    // });
                  },
                  icon: favDbObject.values
                          .where((element) => element.songId == id)
                          .isEmpty
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite, color: Colors.red));
            }),
            const SizedBox(width: 18),
            PopUp(ctx: context, song: song)
          ],
        ));
  }
}
