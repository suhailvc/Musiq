import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:project_music_player/domain/db_model/most_played/most_played_model.dart';
import 'package:project_music_player/infrastructure/most_played/most_played_function.dart';

part 'most_played_bloc_event.dart';
part 'most_played_bloc_state.dart';

class MostPlayedBlocBloc
    extends Bloc<MostPlayedBlocEvent, MostPlayedBlocState> {
  MostPlayedBlocBloc()
      : super(MostPlayedBlocInitial(mostPlayedListBloc: mostPlayedDb)) {
    on<MostPlayedBloc>((event, emit) {
      mostPlayedSong(event.song);
      return emit(MostPlayedBlocState(mostPlayedListBloc: mostPlayedDb));
    });
  }
}
