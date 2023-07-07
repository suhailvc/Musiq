import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:on_audio_query/on_audio_query.dart';
import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
//import 'package:project_music_player/DataBase/Functions/most_played/most_played_function.dart';
//import 'package:project_music_player/Data_Base/Functions/FavouritesScreen/FavouritesFunction.dart';
//import 'package:project_music_player/Data_Base/Functions/Play_Music.dart';
import 'package:project_music_player/Functions/FavouritesScreen/FavouritesFunction.dart';
import 'package:project_music_player/Functions/Play_Music.dart';
import 'package:project_music_player/Screens/favourite/Favourites.dart';
import 'package:project_music_player/Screens/main_player/MainPlayer.dart';
// import 'package:project_music_player/Screens/MiniPlayer.dart';
import 'package:project_music_player/Screens/most_played/MostPlayedScreen.dart';
import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
import 'package:project_music_player/Screens/recently_played/RecentlyPlayedScreen.dart';
import 'package:project_music_player/Screens/settings/main_Screen/SettingsScreen.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';
// import 'package:project_music_player/widgets/FavouritesScreen/SongsList.dart';
import 'package:project_music_player/widgets/HomeScreen/Card1.dart';
//import 'package:flutter/material.dart';
import 'package:project_music_player/widgets/HomeScreen/AllSongs.dart';
//import 'package:project_music_player/widgets/HomeScreen/Card1.dart';
//import 'package:project_music_player/widgets/HomeScreen/CutomAppBar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  void initState() {
    favFetch();
    getPlayList();
    //mostPlayedFetch();
    super.initState();
  }

  var screenNames = [
    'Play List',
    'Most Played',
    'Favourites',
    'Recently Played'
  ];
  var screensPhotos = [
    'assets/images/PlayList icon.jpg',
    'assets/images/MostPlayed Icon.jpg',
    'assets/images/Favourites Icon.jpg',
    'assets/images/Recently Played Icon.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      // appBar: CustomAppBar1(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.8)
              ])),
          child: ListView(
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.all(
                  size.height * 0.02,
                ),
                child: Row(
                  children: [
                    Text(
                      'MUSIQ',
                      style: GoogleFonts.lato(
                        fontSize: size.height * 0.03,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsScreen(),
                                ));
                          },
                          child: const Icon(Icons.settings)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 280,
                child: ListView.builder(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: screenNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlayList(),
                              ));
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MostPlayedScreen(),
                              ));
                        }
                        if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavouritesScreen(),
                              ));
                        }
                        if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RecentlyPlayedScreen(),
                              ));
                        }
                      },
                      child: CardList(
                          image: screensPhotos[index],
                          text: screenNames[index]),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 17, top: 10),
                child: Text(
                  'All Songs',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: songAll.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () /*async*/ {
                          /*await*/ playMusic(index, songAll);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            playingList.add(Audio(songAll[index].url!));
                            return ValueListenableBuilder(
                              valueListenable: favDbObject.listenable(),
                              builder: (context, value, child) {
                                // mostPlayedSong(songAll[index]);
                                return MainPlayer(
                                  song: songAll[index],
                                  id: songAll[index].id!,
                                  // isFav: contains
                                );
                              },
                            );
                          }));
                        },
                        child: Column(
                          children: [
                            AllSongs(
                                song: songAll[index],
                                index: index,
                                id: songAll[index].id!,
                                title1: songAll[index].name ?? 'untitled',
                                subTitle1: songAll[index].artist ?? 'unknown'),
                          ],
                        ));
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.13,
              )
            ],
          ),
        ),
      ),
    );
  }
}
