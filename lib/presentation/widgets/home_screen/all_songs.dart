import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
//import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/model/song_details_model.dart';
import 'package:project_music_player/presentation/widgets/home_screen/fav_Icon.dart';
import 'package:project_music_player/presentation/widgets/popup.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';

// ignore: must_be_immutable
class AllSongs extends StatelessWidget {
  String title1;
  String subTitle1;
  int id;
  int index;
  SongDetails song;
  //BuildContext ctx;

  AllSongs(
      {required this.song,
      required this.title1,
      required this.subTitle1,
      required this.id,
      required this.index,
      //  required this.ctx,
      super.key});

  int count = 0;

  late bool songNotPresent = false;

  Color favColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade800.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Container(
                  width: 55,
                  height: 55,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: QueryArtworkWidget(
                      id: id,
                      type: ArtworkType.AUDIO,
                      artworkHeight: size.height * .4,
                      artworkWidth: size.height * .4,
                      artworkFit: BoxFit.cover,
                      artworkQuality: FilterQuality.high,
                      artworkBorder: BorderRadius.circular(130),
                      size: 2000,
                      quality: 100,
                      nullArtworkWidget: CircleAvatar(
                          radius: size.height * 0.19,
                          backgroundImage: const AssetImage(
                              'assets/images/Recently Played Icon.jpg')))
                  //ClipRRect(
                  //   borderRadius: BorderRadius.circular(10),
                  //   child: Image.asset(
                  //     'assets/images/PlayList.jpeg',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  ),
              title: Text(
                title1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                subTitle1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //ValueListenableBuilder(
                  //valueListenable: favDbObject.listenable(),
                  //  builder: (context, value, child) {
                  // bool contains = favDbObject.values
                  //     .where((element) => element.songId == widget.id)
                  //     .isEmpty,
                  //return
                  FavIcon(
                      // isFav: contains,
                      index: index,
                      id: id),
                  // },
                  // ),
                  const SizedBox(width: 15),
                  // GestureDetector(child: Icon(Icons.more_vert))

                  PopUp(ctx: context, song: song)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
