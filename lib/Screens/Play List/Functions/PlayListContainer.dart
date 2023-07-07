import 'package:flutter/material.dart';
import 'package:project_music_player/widgets/playList/PopUpPlayList.dart';

// ignore: non_constant_identifier_names
Widget PlayListContainer(
    BuildContext context, var playListName, int playListIndex) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage('assets/images/PlayList 1.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [PopUpPlayList(playListIndex: playListIndex)],
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color.fromARGB(131, 255, 255, 255)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.019),
                Padding(
                  padding: EdgeInsets.only(left: size.height * 0.01),
                  child: Text(
                    playListName,
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
