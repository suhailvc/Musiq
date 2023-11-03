part of 'find_song_bloc_bloc.dart';

class FindSongBlocEvent {}

class GetSongEvent extends FindSongBlocEvent {
  final ACRCloudResponseMusicItem? music;

  GetSongEvent(this.music);
}

class AcrCloudSetUp extends FindSongBlocEvent {}
