part of 'favourites_bloc_bloc.dart';

class FavouritesBlocState {
  final List<SongDetails> fouriteSongBloc;

  FavouritesBlocState({required this.fouriteSongBloc});
}

class FavouritesBlocInitial extends FavouritesBlocState {
  FavouritesBlocInitial({required super.fouriteSongBloc});
}
