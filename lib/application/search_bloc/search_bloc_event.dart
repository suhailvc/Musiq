part of 'search_bloc_bloc.dart';

class SearchBlocEvent {
  final String valueBloc;

  SearchBlocEvent(this.valueBloc);
}

class SearchBloc extends SearchBlocEvent {
  SearchBloc(super.valueBloc);
}
