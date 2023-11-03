import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/favourites_bloc/favourites_bloc_bloc.dart';
//import 'package:project_music_player/Data_Base/Functions/AllSongs/All_Songs_Function.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';

// ignore: must_be_immutable
class FavIcon extends StatelessWidget {
  int id;
  int? index;
  //bool isFav;

  FavIcon({this.index, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      //print('dblength =${allsongDb.length}');
      if (favDbObject.values.where((element) => element.songId == id).isEmpty) {
        //  widget.isFav = false;
        //removeFromFav(widget.id);

        context.read<FavouritesBlocBloc>().add(AddToFavouriteBloc(id: id));
      } else {
        // widget.isFav = true;
        //addTofavourite(widget.id);
        context.read<FavouritesBlocBloc>().add(RemoveFromFavBloc(id: id));
      }
    }, child: BlocBuilder<FavouritesBlocBloc, FavouritesBlocState>(
      builder: (context, state) {
        return favDbObject.values
                .where((element) => element.songId == id)
                .isEmpty
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite, color: Colors.red);
      },
    ));
  }
}
