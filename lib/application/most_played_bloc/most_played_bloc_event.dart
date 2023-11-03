part of 'most_played_bloc_bloc.dart';

class MostPlayedBlocEvent {}

class MostPlayedBloc extends MostPlayedBlocEvent {
  final MostPlayedModel song;

  MostPlayedBloc({required this.song});
}
