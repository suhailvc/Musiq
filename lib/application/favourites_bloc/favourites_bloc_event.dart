part of 'favourites_bloc_bloc.dart';

class FavouritesBlocEvent {}

class AddToFavouriteBloc extends FavouritesBlocEvent {
  final int id;

  AddToFavouriteBloc({required this.id});
}

class RemoveFromFavBloc extends FavouritesBlocEvent {
  final int id;

  RemoveFromFavBloc({required this.id});
}
