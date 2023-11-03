part of 'recently_played_bloc_bloc.dart';
// import 'package:project_music_player/domain/db_model/recently_played_model/recently_played_model.dart';

class RecentlyPlayedBlocState {
  final Box<RecentlyPlayedModel> recentlyPlayedBloc;

  RecentlyPlayedBlocState({required this.recentlyPlayedBloc});
}

class RecentlyPlayedBlocInitial extends RecentlyPlayedBlocState {
  RecentlyPlayedBlocInitial({required super.recentlyPlayedBloc});
}
