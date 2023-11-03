import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';
//import 'package:project_music_player/DataBase/Functions/most_played/most_played_function.dart';
import 'package:project_music_player/infrastructure/play_music/play_music.dart';
import 'package:project_music_player/core/global_files/global_files.dart';
import 'package:project_music_player/presentation/main_player/main_player.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return player.builderCurrent(builder: (context, playing) {
      int id = int.parse(playing.audio.audio.metas.id!);

      currentsongFinder(id, context);
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 70, 39, 161),
            ),
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MainPlayer(
                        id: 1, //isFav: false
                      );
                    },
                  ));
                },
                leading: QueryArtworkWidget(
                  id: int.parse(playing.audio.audio.metas.id!),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const CircleAvatar(
                      radius: 28,
                      backgroundImage:
                          AssetImage('assets/images/PlayList.jpeg')),
                  artworkFit: BoxFit.fill,
                ),
                title: Marquee(
                  text: player.getCurrentAudioTitle,
                  blankSpace: 90,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: PlayerBuilder.isPlaying(
                    player: player,
                    builder: (context, isPlaying) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await player.previous();
                                // setState(() {});
                                if (isPlaying == false) {
                                  player.pause();
                                }
                              },
                              icon: const Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () async {
                                await player.playOrPause();
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () async {
                                await player.next();
                                // setState(() {});
                                if (isPlaying == false) {
                                  player.pause();
                                }
                              },
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              )),
                        ],
                      );
                    }))),
      );
    });
  }
}
