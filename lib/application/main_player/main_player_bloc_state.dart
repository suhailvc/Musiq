part of 'main_player_bloc_bloc.dart';

class MainPlayerBlocState {
  final bool clicked;

  MainPlayerBlocState({required this.clicked});
}

class MainPlayerBlocInitial extends MainPlayerBlocState {
  MainPlayerBlocInitial() : super(clicked: false);
}
