import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:project_music_player/DataBase/Functions/most_played/most_played_function.dart';
import 'package:project_music_player/DataBase/Functions/recently_played/recently_played_function.dart';
import 'package:project_music_player/DataBase/Model/most_played/most_played_model.dart';
import 'package:project_music_player/DataBase/Model/recently_played_model/recently_played_model.dart';
import 'package:project_music_player/Global_Files/Global_Files.dart';
//import 'package:project_music_player/Global_Files/Global_Files.dart';
import 'package:project_music_player/Model/Model.dart';
import 'package:project_music_player/Screens/splash_screen/SplashScreen.dart';

List<Audio> playingList = [];

playMusic(int index, List<SongDetails> songs) async {
  playingList.clear();
  for (var element in songs) {
    playingList.add(Audio.file(element.url!,
        metas: Metas(
            title: element.name,
            artist: element.artist,
            id: element.id.toString())));
  }
  await player.open(Playlist(audios: playingList, startIndex: index),
      showNotification: true, loopMode: LoopMode.playlist);
  //player.setLoopMode(LoopMode.playlist);
}

currentsongFinder(int? playingId, BuildContext context) async {
  for (SongDetails song in songAll) {
    if (song.id == playingId) {
      currentplaying = song;
      break;
    }
  }
  RecentlyPlayedModel rPSong;
  rPSong = RecentlyPlayedModel(
      name: currentplaying!.name,
      artist: currentplaying!.artist,
      duration: currentplaying!.duration,
      id: currentplaying!.id,
      url: currentplaying!.url);
  MostPlayedModel mPSOng;
  mPSOng = MostPlayedModel(
      url: currentplaying!.url!,
      songName: currentplaying?.name ?? 'unknown',
      duration: currentplaying!.duration!,
      artist: currentplaying?.artist ?? 'unknown',
      songId: currentplaying?.id!);
  mostPlayedSong(mPSOng);
  getRecentlyPlayed(rPSong);
}

SongDetails? currentplaying;
