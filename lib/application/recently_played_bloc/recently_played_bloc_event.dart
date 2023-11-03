part of 'recently_played_bloc_bloc.dart';

class RecentlyPlayedBlocEvent {}

class GetRecentlyPlayedBloc extends RecentlyPlayedBlocEvent {
  final RecentlyPlayedModel song;

  GetRecentlyPlayedBloc({required this.song});
}
