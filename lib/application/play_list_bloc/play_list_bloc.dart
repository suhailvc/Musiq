import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_music_player/infrastructure/play_list/each_play_list.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';

part 'play_list_event.dart';
part 'play_list_state.dart';

class PlayListBloc extends Bloc<PlayListEvent, PlayListState> {
  PlayListBloc()
      : super(PlayListInitial(playListNotifierBloc: playListNotifier)) {
    on<CreatePlayListBloc>((event, emit) {
      createPlayList(event.name);
      return emit(PlayListState(playListNotifierBloc: playListNotifier));
    });
    on<DeletePlayListBloc>((event, emit) {
      deletePlayList(event.index);
      return emit(PlayListState(playListNotifierBloc: playListNotifier));
    });
    on<RenamePlayListBloc>((event, emit) {
      playListRename(event.index, event.name);
      return emit(PlayListState(playListNotifierBloc: playListNotifier));
    });
  }
}
