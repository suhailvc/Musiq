import 'package:bloc/bloc.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';
import 'package:meta/meta.dart';

part 'find_song_bloc_event.dart';
part 'find_song_bloc_state.dart';

class FindSongBlocBloc extends Bloc<FindSongBlocEvent, FindSongBlocState> {
  FindSongBlocBloc() : super(FindSongBlocInitial(null)) {
    on<GetSongEvent>((event, emit) {
      ACRCloud.setUp(const ACRCloudConfig(
          'cf92a391823f383213e75eafefdd941a',
          "alUP6dec4UifnvUrACSKddT9Fsx7tt3aTQXpQgVq",
          'identify-ap-southeast-1.acrcloud.com'));
      emit(FindSongBlocState(event.music));
    });
  }
}
