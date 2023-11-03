part of 'play_list_bloc.dart';

class PlayListEvent {}

class CreatePlayListBloc extends PlayListEvent {
  final String name;

  CreatePlayListBloc(this.name);
}

class DeletePlayListBloc extends PlayListEvent {
  final int index;

  DeletePlayListBloc(this.index);
}

class RenamePlayListBloc extends PlayListEvent {
  final int index;
  final String name;

  RenamePlayListBloc(this.index, this.name);
}
