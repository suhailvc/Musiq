import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_player_bloc_event.dart';
part 'main_player_bloc_state.dart';

class MainPlayerBlocBloc
    extends Bloc<MainPlayerBlocEvent, MainPlayerBlocState> {
  MainPlayerBlocBloc() : super(MainPlayerBlocInitial()) {
    on<MainPlayerBlocEvent>((event, emit) {});
  }
}
