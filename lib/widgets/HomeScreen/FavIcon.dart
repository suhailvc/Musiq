import 'package:flutter/material.dart';
//import 'package:project_music_player/Data_Base/Functions/AllSongs/All_Songs_Function.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';

// ignore: must_be_immutable
class FavIcon extends StatefulWidget {
  int id;
  int? index;
  bool isFav;

  FavIcon({required this.isFav, this.index, required this.id, super.key});

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //print('dblength =${allsongDb.length}');
          if (!widget.isFav) {
            widget.isFav = false;
            removeFromFav(widget.id);
          } else {
            widget.isFav = true;
            addTofavourite(widget.id);
          }
        },
        child: !widget.isFav
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite));
  }
}
