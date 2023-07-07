//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:project_music_player/Functions/Play_Music.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/main_player/MainPlayer.dart';
//import 'package:project_music_player/Screens/MiniPlayer.dart';
import 'package:project_music_player/Screens/Search/SubScreen/SongList.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';

class SearchSong extends StatefulWidget {
  const SearchSong({super.key});

  @override
  State<SearchSong> createState() => _SearchSongState();
}

class _SearchSongState extends State<SearchSong> {
  List<SongDetails> searchSong = List.from(songAll);
  // List<Audio> allSongIn = [];
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 8, 2, 31),
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        title: const Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 226, 222, 222)),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade800,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: size.height * 0.03, right: size.height * 0.03),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // stops: [0.5, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.17),
            Text(
              'Search',
              style:
                  TextStyle(fontSize: size.height * 0.03, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.02),
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                search(searchController.text);
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'Search your song here'),
            ),
            SizedBox(height: size.height * 0.01),
            Expanded(
              child: searchSong.isEmpty
                  ? const Center(child: Text('Not found'))
                  : ListView.builder(
                      physics:
                          const ScrollPhysics(parent: BouncingScrollPhysics()),
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      itemCount: searchSong.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            playMusic(index, searchSong);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MainPlayer(
                                  id: searchSong[index].id!,
                                  // isFav: true,
                                  song: searchSong[index],
                                );
                              },
                            ));
                          },
                          child: SongList(
                              id: searchSong[index].id!,
                              songName: searchSong[index].name ?? 'Unknown',
                              artistName: searchSong[index].artist ?? 'unknown',
                              index: index,
                              song: searchSong[index]),
                        );
                      },
                    ),
            ),
            // SizedBox(
            //   height: size.height * 0.22,
            // )
          ],
        ),
      ),
    );
  }

  search(String value) {
    setState(() {
      searchSong = songAll
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase().trim()))
          .toList();
      // for (SongDetails elements in searchSong) {
      //   allSongIn.add(Audio.file(elements.url.toString(),
      //       metas: Metas(title: elements.name, id: elements.id.toString())));
      // }
    });
  }
}
