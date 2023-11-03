import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_music_player/model/song_details_model.dart';
import 'package:project_music_player/presentation/search/main_screen/search.dart';
import 'package:project_music_player/presentation/splash_screen/splash_screen.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  final SearchSong songObject = SearchSong();
  SearchBlocBloc() : super(SearchBlocInitial(searchSong)) {
    on<SearchBloc>((event, emit) {
      songObject.search(event.valueBloc);
      return emit(SearchBlocState(searchSong));
    });
  }
}
