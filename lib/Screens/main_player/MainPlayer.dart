import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Functions/Play_Music.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Data_Base/Model/Model.dart';
import 'package:project_music_player/Global_Files/Global_Files.dart';
import 'package:project_music_player/Model/Model.dart';
// import 'package:project_music_player/Model/Model.dart';
//import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';
import 'package:project_music_player/widgets/HomeScreen/FavIcon.dart';
import 'package:project_music_player/widgets/PopUp.dart';
//import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

// ignore: must_be_immutable
class MainPlayer extends StatefulWidget {
  final SongDetails? song;

  int id;
  MainPlayer({this.song, required this.id, super.key});

  @override
  State<MainPlayer> createState() => _MainPlayerState();
}

class _MainPlayerState extends State<MainPlayer> {
  bool repeat = false;
  bool shuffle = false;
  bool pressedNext = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 8, 2, 31),
        // backgroundColor: Color.fromARGB(255, 8, 2, 31),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [PopUp(ctx: context, song: widget.song)],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.5, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF144771), Color(0xFF071A2C)])),
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         // stops: [0.5, 0.8],
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //       Colors.deepPurple.shade800.withOpacity(0.8),
          //       Colors.deepPurple.shade200.withOpacity(0.8)
          //     ])),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: player.builderCurrent(
              builder: (
                context,
                playing,
              ) {
                int currentPlayingId = int.parse(playing.audio.audio.metas.id!);
                currentsongFinder(currentPlayingId, context);

                // bool contains = favDbObject.values
                //     .where((element) => element.songId == currentPlayingId)
                //     .isEmpty;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.15),
                    Center(
                      child: CircleAvatar(
                        radius: size.height * 0.17,
                        child: QueryArtworkWidget(
                            id: currentPlayingId,
                            type: ArtworkType.AUDIO,
                            artworkHeight: size.height * .4,
                            artworkWidth: size.height * .4,
                            artworkFit: BoxFit.cover,
                            artworkQuality: FilterQuality.high,
                            artworkBorder: BorderRadius.circular(130),
                            size: 2000,
                            quality: 100,
                            nullArtworkWidget: CircleAvatar(
                                radius: size.height * 0.17,
                                backgroundImage: const AssetImage(
                                    'assets/images/Perception.jpeg'))),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: Marquee(
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 20,
                        velocity: 40,
                        pauseAfterRound: const Duration(seconds: 1),
                        showFadingOnlyWhenScrolling: true,
                        text: player.getCurrentAudioTitle,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.05),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: Marquee(
                        scrollAxis: Axis.horizontal,
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 20,
                        velocity: 40,
                        pauseAfterRound: const Duration(seconds: 1),
                        showFadingOnlyWhenScrolling: true,
                        text: player.getCurrentAudioArtist,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.023),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ValueListenableBuilder(
                      valueListenable: favDbObject.listenable(),
                      builder: (context, value, child) {
                        bool contains = favDbObject.values
                            .where(
                                (element) => element.songId == currentPlayingId)
                            .isEmpty;
                        return FavIcon(isFav: contains, id: currentPlayingId);
                      },
                    ),
                    // FavIcon(isFav: contains, id: currentPlayingId),
                    GestureDetector(
                      child: SizedBox(
                        height: size.height * 0.02,
                      ),
                    ),
                    player.builderRealtimePlayingInfos(
                      builder: (context, realtimePlayingInfos) {
                        return ProgressBar(
                          baseBarColor: Colors.grey[600],
                          bufferedBarColor: Colors.grey[600],
                          timeLabelTextStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                          progress: realtimePlayingInfos.currentPosition,
                          // buffered: const Duration(milliseconds: 2000),
                          total: realtimePlayingInfos.duration,
                          onSeek: (duration) {
                            player.seek(duration);
                            //print('User selected a new time: $duration');
                          },
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.09),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (shuffle == false) {
                                  shuffle = true;
                                  player.toggleShuffle();
                                } else {
                                  shuffle = false;
                                  player.toggleShuffle();
                                }
                              });
                            },
                            child: player.isShuffling.value == true
                                ? Icon(
                                    Icons.shuffle,
                                    size: size.height * 0.04,
                                    color:
                                        const Color.fromARGB(255, 46, 236, 8),
                                  )
                                : Icon(
                                    Icons.shuffle,
                                    size: size.height * 0.04,
                                    color: Colors.white,
                                  )),
                        //Icon(Icons.favorite),
                        GestureDetector(
                          onTap: () async {
                            if (pressedNext == true) {
                              pressedNext = false;
                              await player.previous(keepLoopMode: true);
                              pressedNext = true;
                            }
                          },
                          child: Icon(
                            Icons.skip_previous_rounded,
                            size: size.height * 0.04,
                            color: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                          radius: size.height * 0.034,
                          child: PlayerBuilder.isPlaying(
                            player: player,
                            builder: (context, isPlaying) {
                              return IconButton(
                                onPressed: () => player.playOrPause(),
                                icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow),
                                iconSize: size.height * 0.04,
                                color: Colors.white,
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (pressedNext == true) {
                              pressedNext = false;
                              await player.next();
                              pressedNext = true;
                            }
                          },
                          child: Icon(
                            Icons.skip_next_rounded,
                            size: size.height * 0.04,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                repeat = !repeat;
                                if (repeat) {
                                  player.toggleLoop();
                                } else {
                                  player.setLoopMode(LoopMode.playlist);
                                }
                              });
                            },
                            child: !repeat
                                ? Icon(
                                    Icons.repeat,
                                    size: size.height * 0.04,
                                    color: Colors.white,
                                  )
                                : Icon(Icons.repeat,
                                    size: size.height * 0.04,
                                    color:
                                        const Color.fromARGB(255, 8, 211, 35)))
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
