part of 'play_list_bloc.dart';

class PlayListState {
  final List<EachPlayList> playListNotifierBloc;

  PlayListState({required this.playListNotifierBloc});
}

class PlayListInitial extends PlayListState {
  PlayListInitial({required super.playListNotifierBloc});
}
