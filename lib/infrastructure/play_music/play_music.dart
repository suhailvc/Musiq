import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/most_played_bloc/most_played_bloc_bloc.dart';
import 'package:project_music_player/application/recently_played_bloc/recently_played_bloc_bloc.dart';
import 'package:project_music_player/infrastructure/most_played/most_played_function.dart';
import 'package:project_music_player/infrastructure/recently_played/recently_played_function.dart';
import 'package:project_music_player/domain/db_model/most_played/most_played_model.dart';
import 'package:project_music_player/domain/db_model/recently_played_model/recently_played_model.dart';
import 'package:project_music_player/core/global_files/global_files.dart';
//import 'package:project_music_player/Global_Files/Global_Files.dart';

import 'package:project_music_player/model/song_details_model.dart';
import 'package:project_music_player/presentation/splash_screen/splash_screen.dart';

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
  // mostPlayedSong(mPSOng);
  context.read<MostPlayedBlocBloc>().add(MostPlayedBloc(song: mPSOng));
  // getRecentlyPlayed(rPSong);
  context
      .read<RecentlyPlayedBlocBloc>()
      .add(GetRecentlyPlayedBloc(song: rPSong));
  // return currentplaying;
}

SongDetails? currentplaying;
