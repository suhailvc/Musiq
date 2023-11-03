import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_music_player/infrastructure/favourites_screen/favourites_function.dart';
import 'package:project_music_player/model/song_details_model.dart';

part 'favourites_bloc_event.dart';
part 'favourites_bloc_state.dart';

class FavouritesBlocBloc
    extends Bloc<FavouritesBlocEvent, FavouritesBlocState> {
  FavouritesBlocBloc()
      : super(FavouritesBlocInitial(fouriteSongBloc: favouritesSongs)) {
    on<AddToFavouriteBloc>((event, emit) async {
      List<SongDetails> tempAddFav = await addTofavourite(event.id);
      return emit(FavouritesBlocState(fouriteSongBloc: tempAddFav));
    });
    on<RemoveFromFavBloc>((event, emit) async {
      List<SongDetails> tempRemoveFav = await removeFromFav(event.id);
      return emit(FavouritesBlocState(fouriteSongBloc: tempRemoveFav));
    });
  }
}
