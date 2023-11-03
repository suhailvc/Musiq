part of 'find_song_bloc_bloc.dart';

class FindSongBlocState {
  final ACRCloudResponseMusicItem? music;

  FindSongBlocState(this.music);
}

class FindSongBlocInitial extends FindSongBlocState {
  FindSongBlocInitial(super.music);
}
