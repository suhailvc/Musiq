import 'package:bloc/bloc.dart';
//import 'package:meta/meta.dart';
//import 'package:project_music_player/application/play_list_bloc/play_list_bloc.dart';
import 'package:project_music_player/infrastructure/play_list/each_play_list.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';
import 'package:project_music_player/model/song_details_model.dart';

part 'play_list_song_event.dart';
part 'play_list_song_state.dart';

class PlayListSongBloc extends Bloc<PlayListSongEvent, PlayListSongState> {
  PlayListSongBloc() : super(PlayListSongInitial(playListNotifier)) {
    on<AddSongToPlayListBloc>((event, emit) async {
      await addSongToPlayList(event.songBloc, event.playListNameBloc);

      return emit(PlayListSongState(playListNotifier));
    });
    on<RemoveSongFromPlayListBloc>((event, emit) async{
     await removeSongfromPlayList(event.songBloc, event.playListNameBloc);

      return emit(PlayListSongState(playListNotifier));
    });
  }
}
