import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

sealed class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  final Failure failure;
  SearchErrorState(this.failure);
}

class SearchSuccessState extends SearchState {
  final List<Movies?>? allSearchedMovies;
  SearchSuccessState({required this.allSearchedMovies});
}
