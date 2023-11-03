part of 'search_bloc_bloc.dart';

class SearchBlocState {
  final List<SongDetails> searchSong;

  SearchBlocState(this.searchSong);
}

class SearchBlocInitial extends SearchBlocState {
  SearchBlocInitial(super.searchSong);
}
