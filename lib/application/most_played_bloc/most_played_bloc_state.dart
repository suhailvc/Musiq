part of 'most_played_bloc_bloc.dart';

class MostPlayedBlocState {
  final Box<MostPlayedModel> mostPlayedListBloc;

  MostPlayedBlocState({required this.mostPlayedListBloc});
}

class MostPlayedBlocInitial extends MostPlayedBlocState {
  MostPlayedBlocInitial({required super.mostPlayedListBloc});
}
