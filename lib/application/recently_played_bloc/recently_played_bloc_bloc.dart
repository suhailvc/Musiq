import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:project_music_player/domain/db_model/recently_played_model/recently_played_model.dart';
import 'package:project_music_player/infrastructure/recently_played/recently_played_function.dart';

part 'recently_played_bloc_event.dart';
part 'recently_played_bloc_state.dart';

class RecentlyPlayedBlocBloc
    extends Bloc<RecentlyPlayedBlocEvent, RecentlyPlayedBlocState> {
  RecentlyPlayedBlocBloc()
      : super(RecentlyPlayedBlocInitial(recentlyPlayedBloc: recentlyPlayedDb)) {
    on<GetRecentlyPlayedBloc>((event, emit) {
      getRecentlyPlayed(event.song);
      return emit(
          RecentlyPlayedBlocState(recentlyPlayedBloc: recentlyPlayedDb));
    });
  }
}
