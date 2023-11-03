part of 'play_list_song_bloc.dart';

class PlayListSongEvent {
  final SongDetails songBloc;
  final String playListNameBloc;

  PlayListSongEvent(this.songBloc, this.playListNameBloc);
}

class AddSongToPlayListBloc extends PlayListSongEvent {
  AddSongToPlayListBloc(super.songBloc, super.playListNameBloc);
}

class RemoveSongFromPlayListBloc extends PlayListSongEvent {
  RemoveSongFromPlayListBloc(super.songBloc, super.playListNameBloc);
}
