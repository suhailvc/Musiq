import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_music_player/Screens/find_songs/FindSong.dart';
import 'package:project_music_player/Screens/home_screen/HomeScreen1.dart';
import 'package:project_music_player/Screens/mini_player/MiniPlayer.dart';
import 'package:project_music_player/Screens/Search/MainScreen/Search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 1;
  var screen = [const FindSong(), const HomeScreen1(), const SearchSong()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: screen[myIndex],
      bottomNavigationBar: Container(
        color: Colors.deepPurple.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                myIndex = index;
              });
            },
            selectedIndex: myIndex,
            gap: 10,
            backgroundColor: Colors.deepPurple.shade800,
            tabBackgroundColor: Colors.grey.shade500,
            padding: const EdgeInsets.all(6),
            tabs: const [
              GButton(
                icon: Icons.bolt,
                text: 'Shazaam',
                iconSize: 25,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
              ),
              GButton(
                icon: Icons.home,
                text: "Home",
                iconSize: 30,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              ),
              GButton(
                icon: Icons.search,
                text: 'search',
                iconSize: 25,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
              )
            ],
          ),
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }
}
