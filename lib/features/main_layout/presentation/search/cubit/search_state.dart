import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/main_layout/data/models/movies_list_model/movies_list_model.dart';

sealed class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class ErrorState extends SearchState {
  final Failure failure;
  ErrorState(this.failure);
}

class SuccessSearchState extends SearchState {
  final MoviesListModel moviesListModel;
  SuccessSearchState(this.moviesListModel);
}
